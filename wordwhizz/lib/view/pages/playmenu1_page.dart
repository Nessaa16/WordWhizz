part of 'pages.dart';
class Chapter1 extends StatefulWidget {
  const Chapter1({Key? key}) : super(key: key);

  @override
  _Chapter1State createState() => _Chapter1State();
}

class _Chapter1State extends State<Chapter1> {
  List<Potion> potions = [
    Potion(image: 'assets/images/greenpotion.png', quantity: 0),
    Potion(image: 'assets/images/orangepotion.png', quantity: 0),
    Potion(image: 'assets/images/bluepotion.png', quantity: 0),
  ];

  Future<void> _fetchPotions() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Ambil data user dari Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          setState(() {
            potions = [
              Potion(
                image: 'assets/images/greenpotion.png',
                quantity: userData['potionhijau'] ?? 0,
              ),
              Potion(
                image: 'assets/images/orangepotion.png',
                quantity: userData['potionkuning'] ?? 0,
              ),
              Potion(
                image: 'assets/images/bluepotion.png',
                quantity: userData['potionbiru'] ?? 0,
              ),
            ];
          });
        }
      }
    } catch (e) {
      print('Error fetching potions: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPotions(); 
  }

  @override
  Widget build(BuildContext context) {
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
                  TopNavbar(
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                  ),
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
                  const SizedBox(height: 40),
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
                              potions: potions,
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
                              levelNumber: '1-2',
                              isLocked: true,
                              onTap: () {},
                              showPopup: true,
                              potions: potions,
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
                              potions: potions,
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
                              potions: potions,
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
                              potions: potions,
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
                              potions: potions,
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
        ],
      ),
    );
  }
}
