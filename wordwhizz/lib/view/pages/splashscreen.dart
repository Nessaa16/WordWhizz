import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wordwhizz/view/pages/pages.dart';

class Splashscreen extends StatefulWidget {
  final Widget navigateTo; 

  const Splashscreen({super.key, required this.navigateTo});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation to the provided destination after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.navigateTo),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/images/animations/Animation.json',
          width: 300,
          height: 300,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
