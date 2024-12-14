import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wordwhizz/firebase_options.dart';
import 'package:wordwhizz/view/pages/pages.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: WelcomePage(),
      // home: StoryPage(),
      //home: MainMenuScreen(),
     home: Chapter2(),
      // home: MinigamesScreen(),
      // home: MainMenuScreen(),
    //  home: Chapter1(),
    // home: TebakGambar(),

    );
  }
}
