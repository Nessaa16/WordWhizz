// import 'package:flutter/material.dart';
part of 'pages.dart';
// part 'mainMenu2_page.dart';

class BottomNavbar extends StatelessWidget {
  final void Function()? onHomePressed;
  final void Function()? onGamePressed;
  final void Function()? onStorePressed;
  final void Function()? onProfilePressed;

  const BottomNavbar({
    super.key,
    this.onHomePressed,
    this.onGamePressed,
    this.onStorePressed,
    this.onProfilePressed,
  });

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
            _buildBottomNavItem(
              'assets/images/home.png',
              onPressed: onHomePressed ?? () {},
            ),
            _buildBottomNavItem(
              'assets/images/game.png',
              onPressed: onGamePressed ?? () {},
            ),
            _buildBottomNavItem(
              'assets/images/store.png',
              onPressed: onStorePressed ?? () {},
            ),
            _buildBottomNavItem(
              'assets/images/profile.png',
              onPressed: onProfilePressed ?? () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavItem(String iconPath, {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          iconPath,
          width: 30,
          height: 32,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}