part of 'pages.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  _GachaPageState createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  // Rewards list
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

  String? _currentReward; // Currently drawn reward
  bool _isAnimationPlaying = false; // To track if the animation is running

  void _startGacha() {
    setState(() {
      _isAnimationPlaying = true; // Start animation
    });

    // Simulate animation duration (e.g., 3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      final random = Random();
      final randomIndex = random.nextInt(_rewards.length);

      setState(() {
        _currentReward = _rewards[randomIndex];
        _isAnimationPlaying = false; // Stop animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/bgsplash.png'), // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reward Display (after animation)
                if (_currentReward != null && !_isAnimationPlaying)
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
                            fontSize: 20, color: Colors.black87),
                      ),
                    ],
                  ),

                // Animation Display (during gacha pull)
                if (_isAnimationPlaying)
                  Lottie.asset(
                    'assets/images/animations/gacha.json', // Your chest animation JSON file
                    width: 200,
                    height: 200,
                  ),

                const SizedBox(height: 30),

                // Gacha Button
                if (!_isAnimationPlaying)
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
    );
  }
}
