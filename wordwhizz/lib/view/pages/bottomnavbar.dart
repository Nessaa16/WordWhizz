part of 'pages.dart';

class BottomNavbar extends StatefulWidget {
  final Function()? onHomePressed;
  final Function()? onGamePressed;
  final Function()? onStorePressed;
  final Function()? onProfilePressed;

  const BottomNavbar({
    super.key,
    this.onHomePressed,
    this.onGamePressed,
    this.onStorePressed,
    this.onProfilePressed,
  });

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        widget.onHomePressed?.call() ??
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenuScreen()),
            );
        break;
      case 1:
        widget.onGamePressed?.call() ??
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MinigamesScreen()),
            );
        break;
      case 2:
        widget.onStorePressed?.call() ??
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
        break;
      case 3:
        widget.onProfilePressed?.call() ??
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(selectedCharacter: '')),
            );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset(
            'assets/images/bottomnav_background.png',
            width: double.infinity,
            height: 82,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 4; i++)
              _buildBottomNavItem(
                iconPath: _getIconPath(i),
                label: _getLabel(i),
                index: i,
              ),
          ],
        ),
      ],
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/home.png';
      case 1:
        return 'assets/images/game.png';
      case 2:
        return 'assets/images/store.png';
      case 3:
        return 'assets/images/profile.png';
      default:
        return '';
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Beranda';
      case 1:
        return 'Permainan';
      case 2:
        return 'Toko';
      case 3:
        return 'Profil';
      default:
        return '';
    }
  }

  Widget _buildBottomNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected ? secondaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Image.asset(
                iconPath,
                width: 30,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'BalooChettan2',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? secondaryColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
