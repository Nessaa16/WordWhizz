part of 'pages.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  String selectedCharacter = "";

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
