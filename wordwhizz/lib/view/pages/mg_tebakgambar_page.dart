part of 'pages.dart';

class TebakGambar extends StatefulWidget {
  const TebakGambar({Key? key}) : super(key: key);

  @override
  _TebakGambarState createState() => _TebakGambarState();
}

class _TebakGambarState extends State<TebakGambar> {
  String? selectedImage;
  String currentWord = '';
  String correctImage = '';
  int progressBarIndex = 0; // Tracks progress (0 to 3)
  bool isAnswerCorrect = false;
  int turnCount = 0; // To track the number of turns
  bool isImageSelected = false; // To track if an image is already selected

  // List of words and their corresponding images
  final Map<String, String> animals = {
    'Kucing': 'assets/images/mmmg-kucing.png',
    'Anjing': 'assets/images/mmmg-anjing.png',
    'Beruang': 'assets/images/mmmg-beruang.png',
    'Kelinci': 'assets/images/mmmg-kelinci.png',
  };

  @override
  void initState() {
    super.initState();
    _randomizeWord();
  }

  // Randomly selects a word and its corresponding image
  void _randomizeWord() {
    List<String> keys = animals.keys.toList();
    keys.shuffle(); // Shuffle the list to pick a random word
    currentWord = keys.first;
    correctImage = animals[currentWord]!;
  }

  // Function to handle the answer selection
  void _onAnimalCardTapped(String imagePath) {
    if (isImageSelected) return; // Prevent selection after an image has been clicked

    setState(() {
      selectedImage = imagePath;
      isAnswerCorrect = (selectedImage == correctImage);
      isImageSelected = true; // Mark image as selected
    });
  }

  // Function to handle moving to the next word or restarting
  void _nextWord() {
    setState(() {
      if (turnCount < 3) {
        turnCount++;
        progressBarIndex++;
        _randomizeWord(); // Randomize the next word and reset selection
        selectedImage = null; // Reset image selection
        isImageSelected = false; // Reset image selection flag
      } else {
        // Reset the game when 4 turns are completed
        turnCount = 0;
        progressBarIndex = 0;
        _randomizeWord(); // Randomize the first word again
        selectedImage = null; // Reset image selection
        isImageSelected = false; // Reset image selection flag
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/tebakgambarbackground.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: Column(
              children: [
                // Animated Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Image.asset(
                    'assets/images/${progressBarIndex}bar.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),

                // Question Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Image.asset(
                    'assets/images/mmmg-pilihgambar.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // Word to Guess
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    currentWord,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513), // Brown color for text
                    ),
                  ),
                ),

                // Grid of Animals
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildAnimalCard('assets/images/mmmg-anjing.png'),
                      _buildAnimalCard('assets/images/mmmg-kucing.png'),
                      _buildAnimalCard('assets/images/mmmg-kelinci.png'),
                      _buildAnimalCard('assets/images/mmmg-beruang.png'),
                    ],
                  ),
                ),

                const Spacer(),

                // Success or Failure Message
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: isAnswerCorrect ? Color(0xFF76C043) : Color(0xFFE74C3C), // Green or Red
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 8),
                          Text(
                            isAnswerCorrect
                                ? 'Horay! kamu menebak dengan benar'
                                : 'Yahh.. kamu salah menebak',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _nextWord,
                        child: Image.asset(
                          isAnswerCorrect
                              ? 'assets/images/mmmg-lanjutkanbenar.png'
                              : 'assets/images/mmmg-lanjutkansalah.png',
                          height: 48,
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

  Widget _buildAnimalCard(String imagePath) {
    final isSelected = selectedImage == imagePath;
    final isCorrect = isSelected && isAnswerCorrect;
    final isWrong = isSelected && !isAnswerCorrect;

    return GestureDetector(
      onTap: isImageSelected ? null : () => _onAnimalCardTapped(imagePath), // Disable further clicks
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          if (isSelected)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCorrect
                      ? Colors.green // Green outline for correct answer
                      : isWrong
                          ? Colors.red // Red outline for incorrect answer
                          : Colors.transparent, // No outline until selected
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
        ],
      ),
    );
  }
}
