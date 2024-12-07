part of 'pages.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

   @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
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

                SizedBox(height: 40),
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 220,
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width, 
                  height: MediaQuery.of(context).size.height -200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Selamat Datang",
                            style: splashTitle1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Ayo Baca Peraturannya!",
                            style: splashTitle2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of",
                              style: splashContent1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets
                                      .zero,
                                  backgroundColor: Colors
                                      .transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        0),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilesetupPage(),
                                      ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/button1.png',
                                      height: 70,
                                    ),
                                    Positioned(
                                      child: Text("Selanjutnya", style: button1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                            SizedBox(height: 10),
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