part of 'pages.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgsplash2.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Color.fromARGB(255, 50, 44, 97)
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30),

                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 220,
                  ),
                ),
                SizedBox(height: 20),

                // Title
                Text(
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
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
