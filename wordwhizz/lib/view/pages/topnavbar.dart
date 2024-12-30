part of 'pages.dart';
// part 'mainMenu2_page.dart';
class TopNavbar extends StatefulWidget {
  final VoidCallback onBackPressed;

  const TopNavbar({
    super.key,
    required this.onBackPressed,
  });

  @override
  _TopNavbarState createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  String coinCount = "0";
  String heartCount = "0";
  StreamSubscription<DocumentSnapshot>? _userSubscription;

  @override
  void initState() {
    super.initState();
    _setupUserDataStream();
  }

  void _setupUserDataStream() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Set up a real-time listener for user data
      _userSubscription = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.exists && mounted) {
          setState(() {
            coinCount = (snapshot.data()?['coins'] ?? 0).toString();
            heartCount = (snapshot.data()?['lives'] ?? 0).toString();
          });
        }
      }, onError: (error) {
        print("Error listening to user data: $error");
      });
    }
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    _userSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
        GestureDetector(
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainMenuScreen()), 
    );
  },
  child: Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        'assets/images/navbarbackatas.png',
        width: 46,
        height: 46,
        fit: BoxFit.contain,
      ),
      Positioned(
        child: Image.asset(
          'assets/images/backnav.png',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    ],
  ),
),

            const Spacer(),
            Row(
              children: [
                _buildCounter('assets/images/coin.png', coinCount),
                const SizedBox(width: 17),
                _buildCounter('assets/images/heart.png', heartCount),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(String imagePath, String count) {
    return Container(
      width: 79,
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 28,
          ),
          const SizedBox(width: 4),
          Text(
            count,
            style: TextStyle(
              color: secondaryColor,
              fontFamily: 'BalooChettan 2',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}