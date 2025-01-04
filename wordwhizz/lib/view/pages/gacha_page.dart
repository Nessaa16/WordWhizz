part of 'pages.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  _GachaPageState createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  final List<Map<String, String>> _rewards = [
    {'reward': '⭐ 15 gold', 'image': 'assets/images/coins_200.png'},
    {'reward': '⭐ 15 gold', 'image': 'assets/images/coins_200.png'},
    {'reward': '⭐⭐ orange potion', 'image': 'assets/images/orangepotion.png'},
    {'reward': '⭐ 15 gold', 'image': 'assets/images/coins_200.png'},
    {'reward': '⭐ 15 gold', 'image': 'assets/images/coins_200.png'},
    {'reward': '⭐⭐ green potion', 'image': 'assets/images/greenpotion.png'},
    {'reward': '⭐⭐ 100 gold', 'image': 'assets/images/coins_600.png'},
    {'reward': '⭐⭐⭐ lives', 'image': 'assets/images/heart.png'},
    {'reward': '⭐⭐ blue Potion', 'image': 'assets/images/bluepotion.png'},
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, String>? _currentReward;
  bool _isAnimationPlaying = false;

  void _startGacha() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in')),
      );
      return;
    }

    try {
      final userRef = _firestore.collection('users').doc(userId);
      final userData = await userRef.get();

      if (!userData.exists) {
        throw Exception("User data not found");
      }

      final currentData = userData.data() ?? {};
      int currentCoins = currentData['coins'] ?? 0;

      if (currentCoins < 50) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('You need at least 50 coins to play the gacha')),
        );
        return;
      }

      currentCoins -= 50;

      await userRef.update({
        'coins': currentCoins,
      });

      setState(() {
        _isAnimationPlaying = true;
        _currentReward = null;
      });

      await Future.delayed(const Duration(seconds: 3), () {
        final random = Random();
        final randomIndex = random.nextInt(_rewards.length);

        setState(() {
          _currentReward = _rewards[randomIndex];
          _isAnimationPlaying = false;
        });

        _updateUserReward(_currentReward!);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Future<void> _updateUserReward(Map<String, String> reward) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception("User not logged in");
      }

      final userRef = _firestore.collection('users').doc(userId);

      final userData = await userRef.get();
      if (!userData.exists) {
        throw Exception("User data not found");
      }

      final currentData = userData.data() ?? {};
      int currentCoins = currentData['coins'] ?? 0;
      int currentLives = currentData['lives'] ?? 0;

      if (reward['reward']!.contains('gold')) {
        final goldAmount = int.tryParse(reward['reward']!.split(' ')[1]) ?? 0;
        currentCoins += goldAmount;
      }
      if (reward['reward']!.contains('lives')) {
        currentLives += 1;
      }

      await userRef.update({
        'coins': currentCoins,
        'lives': currentLives,
        'lastGachaReward': reward['reward'],
        'lastGachaImage': reward['image'],
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _hideRewardScreen() {
    setState(() {
      _currentReward = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_gacha.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNavbar(
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isAnimationPlaying ||
                    (_currentReward != null && !_isAnimationPlaying))
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_isAnimationPlaying)
                          Lottie.asset(
                            'assets/images/animations/Gacha.json',
                            width: 200,
                            height: 200,
                          ),
                        if (!_isAnimationPlaying && _currentReward != null)
                          Column(
                            children: [
                              Text(
                                '🎉 Congratulations! 🎉',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[800],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image.asset(
                                _currentReward!['image']!,
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _currentReward!['reward']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                if (!_isAnimationPlaying && _currentReward == null)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hadiah',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: _rewards.length,
                          itemBuilder: (context, index) {
                            final reward = _rewards[index]['reward']!;
                            final imagePath = _rewards[index]['image']!;
                            final isPotion = reward.contains('Potion');
                            final isHeart = reward.contains('Heart');

                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.orange, width: 2),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    imagePath,
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    reward,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _startGacha,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '50 gold',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Tap detector layer (for hiding the reward screen)
          if (_isAnimationPlaying || _currentReward != null)
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideRewardScreen,
              ),
            ),
        ],
      ),
    );
  }
}
