part of 'pages.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  final List<StoryContent> _storyContents = [
    StoryContent(
      text: "[Namamu] sedang berlibur di sebuah pulau yang terkenal dengan keindahan alamnya. Saat menjelajahi hutan belantara, [Namamu] menemukan sebuah gua yang belum pernah dijelajahi sebelumnya. Di dalam gua, terdapat sebuah portal yang memancarkan cahaya biru. Dengan rasa penasaran yang besar, [Namamu] memutuskan untuk masuk ke dalam portal.",
      isMonsterTalking: false,
      buttonText: "Maju",
      backgroundImage: 'assets/images/bg_pulau_story.png',
    ),
    StoryContent(
      text: "Portal itu membawa [Namamu] ke sebuah pulau yang sangat aneh. Pulau ini dipenuhi dengan tanaman dan monster yang bisa berbicara. Penduduk pulau ini sangat ramah, tetapi mereka hanya bisa berkomunikasi dalam bahasa Inggris. Untuk bisa meminta bantuan mereka dan menemukan jalan pulang, [Namamu] harus belajar bahasa Inggris dengan cepat.",
      isMonsterTalking: false,
      buttonText: "Ikuti",
      backgroundImage: 'assets/images/portal.png',
    ),
    StoryContent(
      text: "Welcome to our city! What? you can't speak our languages??",
      isMonsterTalking: true,
      buttonText: "Mengangguk",
      backgroundImage: 'assets/images/chapter1.png',
    ),
    StoryContent(
      text: "i'll give you this then!",
      isMonsterTalking: true,
      buttonText: "Ambil tablet",
      backgroundImage: 'assets/images/chapter1.png',
    ),
     StoryContent(
      text: "What are you waiting for? Open it!",
      isMonsterTalking: true,
      buttonText: "Buka tablet",
      backgroundImage: 'assets/images/chapter1.png',
    ),
  ];

  int _currentIndex = 0;
  String username = "Pemain";
  String selectedCharacter = "Karakter Default";

  late AnimationController _bounceController;
  late Animation<Offset> _bounceAnimation;
  late AnimationController _popupController;
  late Animation<double> _popupAnimation;
  late AudioPlayer _audioPlayer;
  late AudioPlayer _walkingPlayer; 

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _fetchUserData();

    _audioPlayer = AudioPlayer(); 
    _walkingPlayer = AudioPlayer();
    _playSoundEffect();
  }

   Future<void> _playSoundEffect() async {
    String soundEffect;

    if (_currentIndex == 0) {
      soundEffect = 'sounds/beach.mp3';
    } else if (_currentIndex == 1) {
      soundEffect = 'sounds/portal.mp3'; 
    } else {
      soundEffect = 'sounds/city.mp3'; 
    }

    await _audioPlayer.setSource(AssetSource(soundEffect));
    await _audioPlayer.setVolume(0.5); 
    await _audioPlayer.resume();
  }

  void _initializeAnimations() {
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.1),
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    ));

    _popupController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _popupAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _popupController,
      curve: Curves.easeOut,
    ));

    _popupController.forward();
  }

   Future<void> _playWalkingSound() async {
    await _walkingPlayer.setSource(AssetSource('sounds/walking.mp3'));
    await _walkingPlayer.setVolume(0.5);
    await _walkingPlayer.resume();
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        var userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          username = userData['username'] ?? "Pemain";
          selectedCharacter = userData['selectedCharacter'] ?? "Karakter Default";
        });
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    }
  }

  String _replacePlaceholders(String text) {
    return text
        .replaceAll("[Namamu]", username)
        .replaceAll("[Karaktermu]", selectedCharacter);
  }
void _nextStoryPart() async {
  if (_storyContents[_currentIndex].buttonText == "Buka tablet") {
    // Cek apakah ini bagian dari cerita atau mini-game
    bool isStoryGame = true;

    // Navigate to the mini-game
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Splashscreen(
          navigateTo: TebakGambar(isStoryGame: isStoryGame),
        ),
      ),
    );

    await _addCoins(20);
  } else {
    setState(() {
      if (_currentIndex < _storyContents.length - 1) {
        _currentIndex++;
        _popupController.forward(from: 0.0);
        if (_storyContents[_currentIndex].buttonText == "Maju") {
          _playWalkingSound();
        }

        _playSoundEffect();
      }
    });
  }
}

Future<void> _addCoins(int coins) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      
      await userDocRef.update({
        'coins': FieldValue.increment(coins),
      });
    }
  } catch (e) {
    debugPrint("Error updating coins: $e");
  }
}
  @override
  void dispose() {
    _bounceController.dispose();
    _popupController.dispose();
    _audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              _storyContents[_currentIndex].backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
         SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                if (_storyContents[_currentIndex].isMonsterTalking) ...[
                  const SizedBox(height: 100),
                  _buildMonsterWithChatBubble(),
                ] else ...[
                  _buildMonsterOnly(),
                  const SizedBox(height: 20),
                ],
                if (!_storyContents[_currentIndex].isMonsterTalking)
                  _buildNarrationBox(),
                const SizedBox(height: 30),
                _buildNextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonsterWithChatBubble() {
    return ScaleTransition(
      scale: _popupAnimation,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              _replacePlaceholders(_storyContents[_currentIndex].text),
              style: const TextStyle(
                fontFamily: 'BalooChettan2',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          SlideTransition(
            position: _bounceAnimation,
            child: Image.asset(
              'assets/images/fluffy.png',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonsterOnly() {
    return ScaleTransition(
      scale: _popupAnimation,
      child: SlideTransition(
        position: _bounceAnimation,
        child: Image.asset(
          'assets/images/kucing.png',
          height: 200,
        ),
      ),
    );
  }

  Widget _buildNarrationBox() {
    return ScaleTransition(
      scale: _popupAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.amber.shade700,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            _replacePlaceholders(_storyContents[_currentIndex].text),
            style: const TextStyle(
              fontFamily: 'BalooChettan2',
              fontSize: 18,
              color: Colors.white,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return ScaleTransition(
      scale: _popupAnimation,
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: _nextStoryPart,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/button1.png',
                height: 70,
              ),
              Text(
                _storyContents[_currentIndex].buttonText,
                style: button1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryContent {
  final String text;
  final bool isMonsterTalking;
  final String buttonText;
  final String backgroundImage;

  StoryContent({
    required this.text,
    required this.isMonsterTalking,
    required this.buttonText,
    required this.backgroundImage,
  });
}