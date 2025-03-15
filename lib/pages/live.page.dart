import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'dart:typed_data';

class LiveHelmetDetectionPage extends StatefulWidget {
  @override
  _LiveHelmetDetectionPageState createState() =>
      _LiveHelmetDetectionPageState();
}

class _LiveHelmetDetectionPageState extends State<LiveHelmetDetectionPage> {
  CameraController? _cameraController;
  bool _isDetecting = false;
  String _detectionResult = "Detecting...";
  tfl.Interpreter? _interpreter;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(frontCamera, ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (!mounted) return;

    setState(() {});
    _startDetection();
  }

  Future<void> _loadModel() async {
    _interpreter =
        await tfl.Interpreter.fromAsset("assets/model_unquant.tflite");
  }

  void _startDetection() {
    _cameraController!.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;

      Uint8List input = _convertCameraImageToByteList(image);
      List<List<double>> output = List.generate(1, (_) => List.filled(2, 0.0));

      _interpreter!.run(input, output);

      double helmetProb = output[0][1];
      setState(() {
        _detectionResult =
            helmetProb > 0.5 ? "Helmet Present ✅" : "No Helmet Detected ❌";
      });

      await Future.delayed(Duration(milliseconds: 500)); // Limit FPS
      _isDetecting = false;
    });
  }

  Uint8List _convertCameraImageToByteList(CameraImage image) {
    // Convert image to appropriate format (resize and normalize if necessary)
    return Uint8List.fromList(image.planes[0].bytes);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _interpreter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Helmet Detection")),
      body: Stack(
        children: [
          _cameraController == null || !_cameraController!.value.isInitialized
              ? Center(child: CircularProgressIndicator())
              : CameraPreview(_cameraController!),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _detectionResult,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
