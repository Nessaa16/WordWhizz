part of 'pages.dart';

class MiniGames2 extends StatefulWidget {
  const MiniGames2({super.key});

  @override
  State<MiniGames2> createState() => _MiniGames2State();
}

class _MiniGames2State extends State<MiniGames2> with TickerProviderStateMixin {
  // Daftar cerita
  final List<String> _storyParts = [
    "[Namamu] sedang berlibur di sebuah pulau yang terkenal dengan keindahan alamnya. Saat menjelajahi hutan belantara, [Namamu] menemukan sebuah gua yang belum pernah dijelajahi sebelumnya. Di dalam gua, terdapat sebuah portal yang memancarkan cahaya biru. Dengan rasa penasaran yang besar, [Namamu] memutuskan untuk masuk ke dalam portal.",
    "Portal itu membawa [Namamu] ke sebuah pulau yang sangat aneh. Pulau ini dipenuhi dengan tanaman dan hewan yang bisa berbicara. Penduduk pulau ini sangat ramah, tetapi mereka hanya bisa berkomunikasi dalam bahasa Inggris. Untuk bisa meminta bantuan mereka dan menemukan jalan pulang, [Namamu] harus belajar bahasa Inggris dengan cepat."
  ];

  // Daftar gambar latar belakang
  final List<String> _backgroundImages = [
    'assets/images/bg_minigames_translate.png', // Gambar latar belakang pertama
  ];

  // // Daftar gambar latar belakang
  // final List<String> _progressBar = [
  //   'assets/images/0bar.png',
  //   'assets/images/1bar.png',
  //   'assets/images/2bar.png',
  //   'assets/images/3bar.png',
  // ];

  int _currentStoryIndex = 0; // Indeks cerita saat ini
  int _currentBackgroundIndex = 0; // Indeks gambar latar belakang saat ini
  // int _currentProgressIndex = 0;

  double _linearProgress = 0.0; // Progress untuk linear progress bar

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  late AnimationController _popupController;
  late Animation<double> _popupAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Ulangi animasi dengan efek reverse

    _animation = Tween<Offset>(
      begin: Offset(0, 0), // Posisi awal
      end: Offset(0, -0.1), // Bergerak sedikit ke atas
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Gunakan efek ease in dan ease out
    ));

    // Inisialisasi controller untuk animasi pop-up
    _popupController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _popupAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _popupController,
      curve: Curves.easeOut,
    ));

    // Jalankan animasi pop-up saat halaman dimuat
    _popupController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _popupController.dispose(); // Dispose controller pop-up
    super.dispose();
  }

  void _nextStoryPart() {
    setState(() {
      if (_currentStoryIndex < _storyParts.length - 1) {
        _currentStoryIndex++; // Pindah ke bagian cerita berikutnya
      } else {
        // Jika sudah di bagian terakhir, bisa direset atau ditangani sesuai kebutuhan
        _currentStoryIndex = 0; // Contoh: kembali ke awal
      }

      // Ubah gambar latar belakang
      if (_currentBackgroundIndex < _backgroundImages.length - 1) {
        _currentBackgroundIndex++; // Pindah ke gambar latar belakang berikutnya
      } else {
        _currentBackgroundIndex = 0; // Kembali ke gambar latar belakang pertama
      }

      // // Ubah gambar progress bar
      // if (_currentProgressIndex < _progressBar.length - 1) {
      //   _currentProgressIndex++; // Pindah ke gambar latar belakang berikutnya
      // } else {
      //   _currentProgressIndex = 0; // Kembali ke gambar latar belakang pertama
      // }

      // Update linear progress
      if (_linearProgress < 1.0) {
        _linearProgress += 0.25; // Increment progress by 25% each time
      } else {
        _linearProgress = 1.0; // Cap progress at 100%
      }

      // Jalankan animasi pop-up saat tombol ditekan
      _popupController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              _backgroundImages[_currentBackgroundIndex], // Gambar latar belakang sesuai indeks
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                // Animated progress bar
                ScaleTransition(
                  scale: _popupAnimation,
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: _linearProgress, // Set the progress value
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      // SizedBox(height: 20),
                      // Image.asset(
                      //   _progressBar[_currentProgressIndex],
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // Card dengan cerita
                ScaleTransition(
                  scale: _popupAnimation,
                  child: Card(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        _storyParts[_currentStoryIndex], // Tampilkan bagian cerita saat ini
                        style: story_content,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Tombol dengan animasi pop-up
                ScaleTransition(
                  scale: _popupAnimation,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          _nextStoryPart(); // Panggil fungsi untuk pindah ke bagian cerita berikutnya
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button1.png',
                              height: 70,
                            ),
                            Positioned(
                              child: Text(
                                _currentStoryIndex == _storyParts.length - 1
                                    ? "Samperin"
                                    : "Maju", // Ubah teks tombol
                                style: button1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
