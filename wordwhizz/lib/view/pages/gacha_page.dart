part of 'pages.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  _GachaPageState createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  final List<String> _rewards = [
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐ gold',
    '⭐⭐ Heart',
    '⭐⭐⭐ Hint Potion'
  ];

  String? _currentReward;
  bool _isAnimationPlaying = false;

  void _startGacha() {
    setState(() {
      _isAnimationPlaying = true;
      _currentReward = null;
    });

    Future.delayed(const Duration(seconds: 3), () {
      final random = Random();
      final randomIndex = random.nextInt(_rewards.length);

      setState(() {
        _currentReward = _rewards[randomIndex];
        _isAnimationPlaying = false;
      });
    });
  }

  void _hideRewardScreen() {
    setState(() {
      _currentReward = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _isAnimationPlaying || _currentReward != null
            ? _hideRewardScreen
            : null,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgsplash.png'),
                  fit: BoxFit.cover,
                ),
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
                              'assets/images/animations/gacha.json',
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
                                Text(
                                  _currentReward!,
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
                        'Gacha',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
