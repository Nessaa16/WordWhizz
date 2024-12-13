part of 'pages.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key, required String selectedCharacter});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> _characters = [
    {
      'name': 'Tikus Ksatria',
      'image': 'assets/images/tikus.png',
      'description': 'assets/images/deskripsiTikus.png',
    },
    {
      'name': 'Kucing Penyihir',
      'image': 'assets/images/kucing.png',
      'description': 'assets/images/deskripsiKucing.png',
    },
    {
      'name': 'Kerbau Pejuang',
      'image': 'assets/images/kerbau.png',
      'description': 'assets/images/deskripsiKerbau.png',
    },
    {
      'name': 'Rubah Pemanah',
      'image': 'assets/images/rubah.png',
      'description': 'assets/images/deskripsiRubah.png',
    },
  ];

  int _currentIndex = 3;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
 
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(0, 0), 
      end: Offset(0, -0.05), 
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeCharacter(int direction) {
    setState(() {
      _currentIndex = (_currentIndex + direction) % _characters.length;
      if (_currentIndex < 0) {
        _currentIndex = _characters.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCharacter = _characters[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgsplash3.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List.generate(_characters.length, (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: _currentIndex == index
                                        ? const Color.fromARGB(255, 50, 44, 97)
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 30),

                            // Logo
                            Image.asset(
                              'assets/images/logo.png',
                              height: constraints.maxHeight * 0.2,
                              width: constraints.maxWidth * 0.6,
                            ),

                            // Title
                            const Text(
                              "Pilih Karaktermu",
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
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),

                            // Character Name
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 9.0,
                                    offset: Offset(4, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(currentCharacter['name']!,
                                  style: character),
                            ),

                            const SizedBox(height: 20),

                            // Character options
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => _changeCharacter(-1),
                                  child: Image.asset(
                                    'assets/images/buttonLeft.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SlideTransition(
                                  position: _animation,
                                  child: Image.asset(
                                    currentCharacter['image']!,
                                    height: constraints.maxHeight * 0.25,
                                    width: constraints.maxWidth * 0.5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _changeCharacter(1),
                                  child: Image.asset(
                                    'assets/images/buttonRight.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Character description
                            Image.asset(
                              currentCharacter['description']!,
                              height: constraints.maxHeight * 0.18,
                              width: constraints.maxWidth * 0.6,
                            ),

                            const Spacer(),

                            // Choose Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      selectedCharacter:
                                          currentCharacter['name']!,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/button1.png',
                                    height: 60,
                                    width: 250,
                                  ),
                                  const Positioned(
                                    child: Text(
                                      "Pilih",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
