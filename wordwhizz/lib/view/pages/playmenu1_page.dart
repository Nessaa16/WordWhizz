part of 'pages.dart';

class Chapter1 extends StatelessWidget {
  const Chapter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundc1.png',
              fit: BoxFit.cover, // Ensures the image scales to cover the screen
            ),
          ),
          // Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 100, bottom: 100), // Leave space for fixed elements
              child: Column(
                children: [
                  // Level Buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 80),
                            child: LevelButton(
                              imagePath: 'assets/images/1-1.png',
                              width: 100,
                              height: 145,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 5),
                            child: LevelButton(
                              imagePath: 'assets/images/1-2.png',
                              width: 100,
                              height: 145,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 5),
                            child: LevelButton(
                              imagePath: 'assets/images/1-3.png',
                              width: 100,
                              height: 145,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 5),
                            child: LevelButton(
                              imagePath: 'assets/images/1-4.png',
                              width: 100,
                              height: 145,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Fixed Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () {
                         Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/backarrow.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Spacer(),
                    // Coins Counter
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/coin.png',
                                height: 35,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '100', // Example coin count
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Hearts Counter
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/heart.png',
                                height: 35,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '5', // Example heart count
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Navigation Bar Background
                  Image.asset(
                    'assets/images/bottomnav_background.png',
                    width: double.infinity,
                    height: 82,
                    fit: BoxFit.cover,
                  ),
                  // Navigation Icons with Manual Padding
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 230),
                    child: Image.asset(
                      'assets/images/home.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 80),
                    child: Image.asset(
                      'assets/images/game.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 80),
                    child: Image.asset(
                      'assets/images/store.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 230),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LevelButton extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const LevelButton({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle level navigation here
      },
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
