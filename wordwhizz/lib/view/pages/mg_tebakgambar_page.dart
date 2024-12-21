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
  bool isAnswerCorrect = false;
  bool isImageSelected = false;

  double progressValue = 0.0; // Nilai progres untuk progress bar

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

  void _randomizeWord() {
    List<String> keys = animals.keys.toList();
    keys.shuffle();
    currentWord = keys.first;
    correctImage = animals[currentWord]!;
  }

  void _onAnimalCardTapped(String imagePath) {
    if (isImageSelected) return;

    setState(() {
      selectedImage = imagePath;
      isAnswerCorrect = (selectedImage == correctImage);
      isImageSelected = true;
    });
  }

  void _nextWord() {
    setState(() {
      if (progressValue < 1.0) {
        progressValue += 0.25;
      } else {
        progressValue = 0.0;
      }

      _randomizeWord();
      selectedImage = null;
      isImageSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/tebakgambarbackground.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 12,
                    ),
                  ),
                ),

                // Question Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Pilih Gambar Yang Tepat',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                        fontFamily: 'BalooChettan2',
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                      color: Color(0xFF8B4513),
                    ),
                  ),
                ),

                // Grid of Animals
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 30,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildAnimalCard('assets/images/mmmg-anjing.png'),
                        _buildAnimalCard('assets/images/mmmg-kucing.png'),
                        _buildAnimalCard('assets/images/mmmg-kelinci.png'),
                        _buildAnimalCard('assets/images/mmmg-beruang.png'),
                      ],
                    ),
                  ),
                ),

                // Success or Failure Message
                if (isImageSelected) // Tampilkan hanya jika user sudah memilih jawaban
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: isAnswerCorrect ? const Color(0xFF76C043) : const Color(0xFFE74C3C),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          isAnswerCorrect
                              ? 'Horay! Kamu Menebak dengan Benar'
                              : 'Yahh.. Kamu Salah Menebak',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: _nextWord,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              'Lanjutkan',
                              style: TextStyle(
                                color: isAnswerCorrect
                                    ? Colors.green // Warna hijau jika benar
                                    : const Color(0xFFFF7600), // Warna orange jika salah
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      onTap: isImageSelected ? null : () => _onAnimalCardTapped(imagePath),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (isCorrect ? Colors.green : Colors.red)
                : Colors.transparent,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
