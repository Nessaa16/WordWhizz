part of 'pages.dart';

class MinigamesScreen extends StatelessWidget {
  const MinigamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundminigames1.png',
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
                          'assets/images/backarrow.png',
                          width: 40, // Match Chapter1 size
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                // Grid of Games
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 1,
                      children: [
                        // Add GestureDetector for navigation
                        GestureDetector(
                          onTap: () {
                            // Navigate to the mg_tebakgambar_page.dart
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TebakGambar(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/tebakgambar.png',
                            width: 64,
                            height: 64,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Image.asset(
                          'assets/images/susunkalimat.png',
                          width: 64,
                          height: 64,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          'assets/images/terjemahkan.png',
                          width: 64,
                          height: 64,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          'assets/images/comingsoon.png',
                          width: 64,
                          height: 64,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),

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
