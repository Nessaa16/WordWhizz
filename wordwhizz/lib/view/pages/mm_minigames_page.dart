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
                // Top Navbar
                TopNavbar(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  coinCount: '100',
                  heartCount: '5',
                ),

                // "MINIGAMES" Title Text
                const SizedBox(height: 20),
                const Text(
                  'MINIGAMES',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'BalooChettan2',
                    shadows: [
                      Shadow(
                        offset: Offset(4, 5),
                        blurRadius: 8,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),

                // Grid of Games
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 55),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildGameCard(
                          context,
                          'assets/images/tebakgambar.png',
                          'Tebak Gambar',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TebakGambar()),
                            );
                          },
                        ),
                        _buildGameCard(
                          context,
                          'assets/images/susunkalimat.png',
                          'Susun Kalimat',
                          () {},
                        ),
                        _buildGameCard(
                          context,
                          'assets/images/terjemahkan.png',
                          'Terjemahkan',
                          () {},
                        ),
                        _buildGameCard(
                          context,
                          'assets/images/comingsoon.png',
                          'Coming Soon',
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Navigation Bar
                BottomNavbar(
                  onHomePressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                    );
                  },
                  onGamePressed: () {
                    print("Game pressed");
                  },
                  onStorePressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopPage()),
                    );
                  },
                  onProfilePressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(selectedCharacter: '')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each game card with white background
  Widget _buildGameCard(BuildContext context, String imagePath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'BalooChettan2',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
