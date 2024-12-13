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
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () {
                          // Handle back navigation
                        },
                        child: Image.asset(
                          'assets/images/backarrow.png', // Custom back arrow asset
                          width: 40, // Set desired width
                          height: 40, // Set desired height
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(),
                      // Coins Counter
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            height: 40,
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Hearts Counter
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/heart.png', // Custom heart asset
                            height: 40, // Set desired height
                            width: 80, // Set desired width
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),

                // Level Buttons
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 80, top: 80), // Adjust padding for 1-1
                            child: LevelButton(
                              imagePath: 'assets/images/1-1.png',
                              width: 90,
                              height: 135,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80, top: 5), // Adjust padding for 1-2
                            child: LevelButton(
                              imagePath: 'assets/images/1-2.png',
                              width: 90,
                              height: 135,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 80, top: 5), // Adjust padding for 1-3
                            child: LevelButton(
                              imagePath: 'assets/images/1-3.png',
                              width: 90,
                              height: 135,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 80, top: 5), // Adjust padding for 1-4
                            child: LevelButton(
                              imagePath: 'assets/images/1-4.png',
                              width: 90,
                              height: 135,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Bottom Navigation Bar
                // Bottom Navigation Bar
                Padding(
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
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 230), // Adjust for 'home'
                        child: Image.asset(
                          'assets/images/home.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 80), // Adjust for 'game'
                        child: Image.asset(
                          'assets/images/game.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 80), // Adjust for 'store'
                        child: Image.asset(
                          'assets/images/store.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 230), // Adjust for 'profile'
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
              ],
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
