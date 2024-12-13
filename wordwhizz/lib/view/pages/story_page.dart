part of 'pages.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}
class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  // Daftar cerita
  final List<String> _storyParts = [
    "[Namamu] sedang berlibur di sebuah pulau yang terkenal dengan keindahan alamnya. Saat menjelajahi hutan belantara, [Namamu] menemukan sebuah gua yang belum pernah dijelajahi sebelumnya. Di dalam gua, terdapat sebuah portal yang memancarkan cahaya biru. Dengan rasa penasaran yang besar, [Namamu] memutuskan untuk masuk ke dalam portal.",
    "Portal itu membawa [Namamu] ke sebuah pulau yang sangat aneh. Pulau ini dipenuhi dengan tanaman dan hewan yang bisa berbicara. Penduduk pulau ini sangat ramah, tetapi mereka hanya bisa berkomunikasi dalam bahasa Inggris. Untuk bisa meminta bantuan mereka dan menemukan jalan pulang, [Namamu] harus belajar bahasa Inggris dengan cepat."
  ];

  int _currentStoryIndex = 0; // Indeks cerita saat ini

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Ulangi animasi dengan efek reverse

    _animation = Tween<Offset>(
      begin: Offset(0.0, -0.1), // Mulai sedikit di atas posisi normal
      end: Offset(0.0, 0.1), // Bergerak sedikit di bawah posisi normal
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut, // Gunakan efek ease in dan ease out
    ));
  }

  @override
  void dispose() {
    _animationController?.dispose();
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/portal.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                // Title
                Text(
                  "Story Page",
                  style: TextStyle(
                    fontFamily: 'BalooChettan2',
                    fontSize: 32.0,
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
                SizedBox(height: 30),
                // Animated Cat Image
                AnimatedBuilder(
                  animation: _animation!,
                  builder: (_, child) => Transform.translate(
                    offset: _animation!.value,
                    child: child,
                  ),
                  child: Image.asset(
                    'assets/images/kucing.png',
                    height: 220,
                    width: 170,
                  ),
                ),
                SizedBox(height: 30),
                Card(
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
                SizedBox(height: 30),
                Align(
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
                            child: Text("Maju", style: button1),
                          ),
                        ],
                      ),
                  ),
                ),
                // SizedBox(height: 30,)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
//   AnimationController? _animationController;
//   Animation<Offset>? _animation;

//   // Daftar cerita
//   final List<String> _storyParts = [
//     "[Namamu] sedang berlibur di sebuah pulau yang terkenal dengan keindahan alamnya. Saat menjelajahi hutan belantara, [Namamu] menemukan sebuah gua yang belum pernah dijelajahi sebelumnya. Di dalam gua, terdapat sebuah portal yang memancarkan cahaya biru. Dengan rasa penasaran yang besar, [Namamu] memutuskan untuk masuk ke dalam portal.",
//     "Portal itu membawa [Namamu] ke sebuah pulau yang sangat aneh. Pulau ini dipenuhi dengan tanaman dan hewan yang bisa berbicara. Penduduk pulau ini sangat ramah, tetapi mereka hanya bisa berkomunikasi dalam bahasa Inggris. Untuk bisa meminta bantuan mereka dan menemukan jalan pulang, [Namamu] harus belajar bahasa Inggris dengan cepat."
//   ];

//   int _currentStoryIndex = 0; // Indeks cerita saat ini

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _animationController?.forward(from: 0.0); // Restart from beginning
//         }
//       });

//     _animation = Tween<Offset>(
//       begin: Offset(0.0, -1.0), // Start off-screen above the visible area
//       end: Offset(0.0, 0.0), // Move to its intended position
//     ).animate(_animationController!);
//   }

//   @override
//   void dispose() {
//     _animationController?.dispose();
//     super.dispose();
//   }

//   void _nextStoryPart() {
//     setState(() {
//       if (_currentStoryIndex < _storyParts.length - 1) {
//         _currentStoryIndex++; // Pindah ke bagian cerita berikutnya
//       } else {
//         // Jika sudah di bagian terakhir, bisa direset atau ditangani sesuai kebutuhan
//         _currentStoryIndex = 0; // Contoh: kembali ke awal
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/portal.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           SafeArea(
//             bottom: false,
//             child: ListView(
//               padding: EdgeInsets.all(20.0),
//               children: [
//                 // Title
//                 Text(
//                   "Story Page",
//                   style: TextStyle(
//                     fontFamily: 'BalooChettan2',
//                     fontSize: 32.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         offset: Offset(2.0, 2.0),
//                         blurRadius: 4.0,
//                         color: Colors.black54,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 // Animated Cat Image
//                 AnimatedBuilder(
//                   animation: _animation!,
//                   builder: (_, child) => Transform.translate(
//                     offset: _animation!.value,
//                     child: child,
//                   ),
//                   child: Image.asset(
//                     'assets/images/kucing.png',
//                     height: 220,
//                     width: 170,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Card(
//                   color: primaryColor,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       _storyParts[
//                           _currentStoryIndex], // Tampilkan bagian cerita saat ini
//                       style: story_content,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: 70,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         backgroundColor: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         elevation: 0,
//                       ),
//                       onPressed: () {
//                         _nextStoryPart(); // Panggil fungsi untuk pindah ke bagian cerita berikutnya
//                       },
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/button1.png',
//                             height: 70,
//                           ),
//                           Positioned(
//                             child: Text("Maju", style: button1),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }