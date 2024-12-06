import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wordwhizz/view/pages/pages.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation to RulesPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RulesPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }

  Widget content() {
    return Center(  
      child: Lottie.asset(
        'assets/images/animations/Animation.json', 
        width: 300, 
        height: 300,  
        fit: BoxFit.fill, 
      ),
    );
  }
}
