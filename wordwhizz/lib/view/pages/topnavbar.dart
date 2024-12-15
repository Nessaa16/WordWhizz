part of 'pages.dart';
// part 'mainMenu2_page.dart';

class TopNavbar extends StatelessWidget {
  final VoidCallback onBackPressed;
  final String coinCount;
  final String heartCount;

  const TopNavbar({
    super.key,
    required this.onBackPressed,
    required this.coinCount,
    required this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBackPressed,
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
              fontSize: 18, // Adjust font size to fit
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}