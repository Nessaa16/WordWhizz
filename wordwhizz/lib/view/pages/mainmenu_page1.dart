part of 'pages.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forest_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
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
                        // Add your play button logic here
                      },
                    ),
                    const SizedBox(height: 16), // Spacing between buttons
                    _buildCustomButton(
                      context,
                      'Keluar',
                      () {
                        // Add your exit button logic here
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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