part of 'pages.dart';

class Chapter1 extends StatelessWidget {
  const Chapter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // list potions
    List<Potion> potions = [
      Potion(image: 'assets/images/greenpotion.png', quantity: 5),
      Potion(image: 'assets/images/orangepotion.png', quantity: 3),
      Potion(image: 'assets/images/bluepotion.png', quantity: 7),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/chapter1.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 7, bottom: 130),
              child: Column(
                children: [
                  // Top Bar
                  TopNavbar(
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    coinCount: '100',
                    heartCount: '5',
                  ),

                  // "CHAPTER 1" Title Text
                  const SizedBox(height: 20),
                  const Text(
                    'CHAPTER 1',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'BalooChettan2',
                      shadows: [
                        Shadow(
                          offset: Offset(4, 5),
                          blurRadius: 8,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),

                  // Level Buttons
                  const SizedBox(height: 40), // Space before level buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-1',
                              isLocked: false,
                              onTap: () {},
                              showPopup: true,
                              potions: potions 
                            ),
                          ),
                        ],
                      ),
                      // buat level yang lain 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-2',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions 
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-3',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions 
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-4',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions 
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-5',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 80, top: 10),
                            child: LevelButton(
                              levelNumber: '1-6',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavbar(
              onHomePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MinigamesScreen()),
                );
              },
              onGamePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MinigamesScreen()),
                );
              },
              onStorePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
              onProfilePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(selectedCharacter: '')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
