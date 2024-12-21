part of 'pages.dart';

class LevelButton extends StatefulWidget {
  final String levelNumber;
  final bool isCompleted;
  final bool isLocked;
  final VoidCallback onTap;
  // karena popup nya akan menyesuaikan dengan levelnya jadi pakai false
//  di chapter tidak pakai pop up
  final bool showPopup;
  final List<Potion> potions;

  const LevelButton({
    Key? key,
    required this.levelNumber,
    this.isCompleted = false,
    this.isLocked = false,
    required this.onTap,
    this.showPopup = false,
    required this.potions
  }) : super(key: key);

  @override
  _LevelButtonState createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  late bool isLocked;
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isLocked = widget.isLocked;
    isCompleted = widget.isCompleted;
  }

  void _handleTap() {
    if (isLocked) {
      // gaada apa-apa kalau locked
      return;
    }
    //  kalau complete kan bisa show popup waktu dimainkan
    if (isCompleted && widget.showPopup) {
      // kasih pop up sebelum main gamenya
      _showPopup(context, widget.levelNumber);
    } else {
      // ganti iconnya jadi terbuka kalau udah complete
      setState(() {
        isCompleted = true;
        isLocked = false;
      });
      if (widget.showPopup) {
        _showPopup(context, widget.levelNumber);
      }
    }
    widget.onTap();
  }

  void _showPopup(BuildContext context, String levelNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BeforeGameAlertDialog(
          levelNumber: levelNumber,
          onClose: (){
            Navigator.of(context).pop(); 
          },
          potions: widget.potions
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
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
                    widget.levelNumber,
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
