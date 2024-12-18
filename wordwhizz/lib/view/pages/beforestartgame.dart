// part of 'pages.dart';

// class Beforestartgame extends StatelessWidget {
//   const Beforestartgame({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/backgroundc1.png',
//               fit: BoxFit.cover, // Ensures the image scales to cover the screen
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.only(
//                   top: 100, bottom: 100), // Leave space for fixed elements
//               child: Column(
//                 children: [
//                   // Level Buttons
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 80, top: 80),
//                             child: LevelButton(
//                               imagePath: 'assets/images/1-1.png',
//                               width: 100,
//                               height: 145,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 80, top: 5),
//                             child: LevelButton(
//                               imagePath: 'assets/images/1-2.png',
//                               width: 100,
//                               height: 145,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 80, top: 5),
//                             child: LevelButton(
//                               imagePath: 'assets/images/1-3.png',
//                               width: 100,
//                               height: 145,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 80, top: 5),
//                             child: LevelButton(
//                               imagePath: 'assets/images/1-4.png',
//                               width: 100,
//                               height: 145,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Fixed Top Bar
//           Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: TopNavbar(
//                   onBackPressed: () {
//                     Navigator.pop(context);
//                   },
//                   coinCount: '100',
//                   heartCount: '5')),
//           // Fixed Bottom Navigation Bar
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: BottomNavbar(
//               onHomePressed: () {
//                 print("Home pressed");
//                 // Navigate to Home
//               },
//               onGamePressed: () {
//                 print("Game pressed");
//                 // Navigate to Games
//               },
//               onStorePressed: () {
//                 print("Store pressed");
//                 // Navigate to Store
//               },
//               onProfilePressed: () {
//                 print("Profile pressed");
//                 // Navigate to Profile
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LevelButton3 extends StatelessWidget {
//   final String imagePath;
//   final double width;
//   final double height;

//   const LevelButton3({
//     Key? key,
//     required this.imagePath,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Handle level navigation here
//       },
//       child: Image.asset(
//         imagePath,
//         width: width,
//         height: height,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
