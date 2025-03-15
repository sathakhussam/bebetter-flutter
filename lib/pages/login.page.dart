import 'package:bebetter/components/custom_text_filed.component.dart';
import 'package:bebetter/pages/home.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(color: Color(0xFFEAF2FF)),
              child: Center(
                child: Icon(Icons.image, color: Color(0xFFB4DBFF), size: 32),
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    hintText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF006FFD),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.disabled)) {
                            return Colors.grey;
                          }
                          return const Color(0xFF006FFD);
                        }),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: "Not a member? ",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8F9098),
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Register now",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF006FFD),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(color: Color(0xFFD4D6DD), thickness: 0.5),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "App made by",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF71727A),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF006FFD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Bhavesh Bellaney",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
