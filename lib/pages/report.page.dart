import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool _isYesSelected = false;
  bool _isNoSelected = false;
  Interpreter? _interpreter;
  String _detectionResult = "Upload an image to check";
  Uint8List? _selectedImage;
  final TextEditingController _licensePlateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  // Load the TensorFlow Lite model
  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset("assets/model_unquant.tflite");
      print("TFLite model loaded successfully!");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  // Run inference on an uploaded image
  Future<void> _runInference(Uint8List imageBytes) async {
    if (_interpreter == null) {
      print("Model not loaded!");
      return;
    }

    // Load and preprocess the image
    img.Image image = img.decodeImage(imageBytes)!;
    image = img.copyResize(image, width: 224, height: 224);

    // Convert image to float32 normalized tensor
    var input = List.generate(
        224,
        (y) => List.generate(224, (x) {
              var pixel = image.getPixel(x, y);
              return [
                pixel.r / 255.0,
                pixel.g / 255.0,
                pixel.b / 255.0,
              ];
            }));

    var inputTensor = [input]; // Reshape for model
    var output = List.filled(2, 0.0).reshape([1, 2]); // Output tensor

    // Run inference
    _interpreter!.run(inputTensor, output);

    // Interpret result
    double noHelmetScore = output[0][0]; // Class 0: No Helmet
    double helmetScore = output[0][1]; // Class 1: Helmet Present

    setState(() {
      _detectionResult = noHelmetScore > helmetScore
          ? "No Helmet Detected ❌"
          : "Helmet Present ✅";
    });
  }

  // Pick an image from files
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true, // Ensure the file bytes are loaded
    );
    if (result != null && result.files.first.bytes != null) {
      Uint8List imageBytes = result.files.first.bytes!;
      setState(() {
        _selectedImage = imageBytes;
      });
      _runInference(imageBytes);
    }
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
    _licensePlateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Page')),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload Image (Motorcycle Report)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12.0),
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _selectedImage == null
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_photo_alternate,
                                    size: 50, color: Colors.grey),
                                SizedBox(height: 8),
                                Text('Tap to select an image'),
                              ],
                            ),
                          )
                        : Image.memory(_selectedImage!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  _detectionResult,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Does the image have a license plate?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isYesSelected = true;
                            _isNoSelected = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: _isYesSelected
                                ? Color(0xFF006FFD)
                                : Colors.transparent,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: _isYesSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isYesSelected = false;
                            _isNoSelected = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: _isNoSelected
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8.0)),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: _isNoSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                if (_isNoSelected) ...[
                  Text(
                    'Upload Evidence Image',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _licensePlateController,
                    decoration: InputDecoration(
                      hintText: 'Enter license plate number',
                      labelText: 'License Plate',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.confirmation_number),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter license plate number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Store license plate value
                    },
                  ),
                  const SizedBox(height: 12.0),
                ]
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please upload an image')),
                  );
                } else if (!_isYesSelected && !_isNoSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Please answer if the image has a license plate')),
                  );
                } else if (_isNoSelected &&
                    (_licensePlateController.text.isEmpty)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter license plate number')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report submitted')),
                  );

                  // Add delay then pop the screen
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.of(context).pop();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Color(0xFF006FFD),
              ),
              child: const Text(
                'Submit Report',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
