part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgsplash.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 5),
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
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/speechbubble.png',
                  height: 100,
                  width: 150,
                ),
                Image.asset(
                  'assets/images/mascott.png',
                  height: 200,
                  width: 150,
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 430,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Whizz",
                            style: splashTitle1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Ayo belajar Bahasa Inggris kapan saja dan di mana saja dengan cara yang menyenangkan dan interaktif!",
                            style: splashContent1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 200,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Splashscreen(
                                        navigateTo: RulesPage(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text("Ayo Mulai", style: button1),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  elevation: 10,
                                  shadowColor: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 200,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  print("Button Pressed");
                                },
                                child: Text("Masuk", style: button2),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: primaryColor, width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
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
