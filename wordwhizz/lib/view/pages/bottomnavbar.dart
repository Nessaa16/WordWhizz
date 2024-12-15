// import 'package:flutter/material.dart';
part of 'pages.dart';
// part 'mainMenu2_page.dart';

class BottomNavbar extends StatelessWidget {
  final List<BottomNavbarItem> items;

  const BottomNavbar({
    super.key,
    required this.items,
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
          children: items
              .map(
                (item) => GestureDetector(
                  onTap: item.onPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Image.asset(
                      item.iconPath,
                      width: 30,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class BottomNavbarItem {
  final String iconPath;
  final VoidCallback onPressed;

  BottomNavbarItem({
    required this.iconPath,
    required this.onPressed,
  });
}