part of pages;

class MainMenuScreen2 extends StatelessWidget {
  const MainMenuScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_mainmenu2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // "Mulai Ceritamu" Section
              Padding(
                padding: const EdgeInsets.only(
                    top: 108.0), // Top padding for the logo
                child: Center(
                  child: SizedBox(
                    width: 329,
                    height: 56,
                    child: Text(
                      "Mulai Ceritamu",
                      style: TextStyle(
                        fontFamily: 'BalooChettan 2',
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 28), // Adjust this height to control spacing
              // Buttons Section
              Column(
                children: [
                  // Chapter 1 Button
                  _buildCustomButton(context, 'CHAPTER 1', () {
                    // Add your play button logic here
                  }, darkGreen, 'assets/images/button_mainmenuhijau.png',
                      'assets/images/playmainmenu2.png'),
                  const SizedBox(height: 46), // Spacing between buttons
                  // Chapter 2 Button
                  _buildCustomButton(context, 'CHAPTER 2', () {
                    // Add your exit button logic here
                  }, yellowColor, 'assets/images/buttonmainmenuyellow.png',
                      'assets/images/kuncikuning.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(
      BuildContext context,
      String text,
      VoidCallback onPressed,
      Color textColor,
      String backgroundImage,
      String iconImage) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Button background image
          Image.asset(
            backgroundImage,
            fit: BoxFit.contain,
          ),
          // Button text with specific alignment
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20), // Change these values to position the text
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // asset buat iconnya
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
                  child: Image.asset(iconImage,
                      width: 25, height: 25, fit: BoxFit.contain),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
