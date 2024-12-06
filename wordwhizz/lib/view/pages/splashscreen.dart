import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; 

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

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
