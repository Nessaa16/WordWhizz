part of 'pages.dart';

class LevelButton extends StatelessWidget {
  final String levelNumber;
  final bool isCompleted;
  final bool isLocked;
  final VoidCallback onTap;

  const LevelButton({
    Key? key,
    required this.levelNumber,
    this.isCompleted = false,
    this.isLocked = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap, // Disable tap if locked
      child: Container(
        width: 100,
        height: 145,
        child: CustomPaint(
          painter: LevelButtonPainter(isLocked: isLocked),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle background and level number
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Level number text
                  Text(
                    levelNumber,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isLocked ? Colors.white : Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Space between circle and icon
              
              // Horizontally centered Lock or Play Icon
              Center(
                child: Icon(
                  isLocked ? Icons.lock : Icons.play_arrow, // Conditional icon
                  color: Colors.lightGreen, // Keep the existing color
                  size: 40, // Icon size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LevelButtonPainter extends CustomPainter {
  final bool isLocked;

  LevelButtonPainter({this.isLocked = false});

  @override
  void paint(Canvas canvas, Size size) {
    final double bottomPadding = 10;

    // Bottom background (unchanged)
    final Paint bottomPaint = Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill;

    final RRect bottomRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, bottomPadding, size.width, size.height),
      Radius.circular(size.width / 2),
    );
    canvas.drawRRect(bottomRRect, bottomPaint);

    // Main white/locked background (unchanged)
    final Paint innerPaint = Paint()
      ..color = isLocked ? Colors.grey.shade300 : Colors.white
      ..style = PaintingStyle.fill;

    final RRect innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.width / 2),
    );
    canvas.drawRRect(innerRRect, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
