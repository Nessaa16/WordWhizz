part of 'pages.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key, required String selectedCharacter});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  String selectedCharacter = "";
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 10),
                 // Character Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 9.0,
                                offset: Offset(4, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Tikus Ksatria",
                            style: character
                          ),
                        ),
                      ],
                    ),

                // Character options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCharacter = "Tikus Ksatria";
                        });
                      },
                      child: Image.asset(
                        'assets/images/tikus.png',
                        height: 250,
                        width: 250,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Character2Page(
                              selectedCharacter: selectedCharacter,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/buttonRight.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),

                Positioned(
                  child: Image.asset(
                    'assets/images/deskripsiTikus.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            selectedCharacter: selectedCharacter,
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
                        Positioned(
                          child: Text(
                            "Pilih", 
                            style: button1
                          ),
                        ),
                      ],
                    ),
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
