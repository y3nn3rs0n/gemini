import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_test/chat_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> init(BuildContext context) async {
    await dotenv.load(fileName: ".env");
    Gemini.init(apiKey: dotenv.env['API_TOKEN'].toString());
    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bot Chat AI',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Text(
                'Powered By:',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Image.asset(
                'assets/images/Gemini-Logo.png',
                scale: 5,
              ),
               const Text(
                '+',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(height: 15,),
              Image.asset(
                'assets/images/flutter.png',
                scale: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
