part of 'pages.dart';
// part of 'topnavbar.dart';
// part of 'bottomnavbar.dart';

class MainMenuScreen2 extends StatelessWidget {
  const MainMenuScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_mainmenu2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Area
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 108), // Adjust spacing
                        Text(
                          "Mulai Ceritamu",
                          style: TextStyle(
                            fontFamily: 'BalooChettan 2',
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(0.0, 3.0),
                                blurRadius: 3.0,
                                color: const Color(0xFF9E9E9E),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Buttons
                        _buildCustomButton(
                          context,
                          'CHAPTER 1',
                          () {},
                          darkGreen,
                          'assets/images/button_mainmenuhijau.png',
                          'assets/images/playmainmenu2.png',
                        ),
                        const SizedBox(height: 46),
                        _buildCustomButton(
                          context,
                          'CHAPTER 2',
                          () {},
                          yellowColor,
                          'assets/images/buttonmainmenuyellow.png',
                          'assets/images/kuncikuning.png',
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNavbar(
              onBackPressed: () {
                Navigator.pop(context);
              },
              coinCount: '100',
              heartCount: '5',
            ),
          ),
          // Bottom Navbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavbar(
              items: [
                BottomNavbarItem(
                  iconPath: 'assets/images/home.png',
                  onPressed: () {
                    // Navigate to Home
                  },
                ),
                BottomNavbarItem(
                  iconPath: 'assets/images/game.png',
                  onPressed: () {
                    // Navigate to Games
                  },
                ),
                BottomNavbarItem(
                  iconPath: 'assets/images/store.png',
                  onPressed: () {
                    // Navigate to Store
                  },
                ),
                BottomNavbarItem(
                  iconPath: 'assets/images/profile.png',
                  onPressed: () {
                    // Navigate to Profile
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
    Color textColor,
    String backgroundImage,
    String iconImage,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(backgroundImage, fit: BoxFit.contain),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'BalooChettan 2',
                    color: textColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3.0),
                        blurRadius: 0,
                        color: const Color(0xFFDCDCDC),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 17),
                  child: Image.asset(
                    iconImage,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
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
