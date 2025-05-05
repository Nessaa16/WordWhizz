part of 'pages.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/forest_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Logo section
                Padding(
                  padding: const EdgeInsets.only(top: 100.0), // Top padding for the logo
                  child: Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                // Adjustable space between logo and buttons
                const SizedBox(height: 50), // Adjust this height to control the distance
                // Buttons section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      _buildCustomButton(
                        context,
                        'Bermain',
                        () {
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainMenuScreen2()
                                    ),
                                  );
                        },
                      ),
                      const SizedBox(height: 16), // Spacing between buttons
                      _buildCustomButton(
                        context,
                        'Ganti Akun',
                        () {
                          _logout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavbar(),
          ),
        ],
      ),
    );
  }

   void _logout(BuildContext context) async {
    await AuthService().signout(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),  
    );
   }

  Widget _buildCustomButton(BuildContext context, String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Button background image
          Image.asset(
            'assets/images/button1.png', // Path to your button asset
            width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            height: 70, // Fixed height for the button
            fit: BoxFit.contain,
          ),
          // Button text
          Text(
            text,
            style: const TextStyle(
              color: Colors.white, // Text color
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}