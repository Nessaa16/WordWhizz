part of 'pages.dart';

class VictoryDialog extends StatelessWidget implements BaseCustomDialog {
  final int score;
  final int coins;
  final VoidCallback onClose;

  const VictoryDialog({
    Key? key,
    required this.score,
    required this.coins,
    required this.onClose,
  }) : super(key: key);

  // @override
  // Widget buildTitle(BuildContext context) {
  //   return Stack(
  //     clipBehavior: Clip.none,
  //     alignment: Alignment.center,
  //     children: [
  //       Container(
  //         width: 250,
  //         height: 80,
  //         decoration: BoxDecoration(
  //           color: const Color(0xFFFF6B00),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: const Center(
  //           child: Text(
  //             'Menang!',
  //             style: TextStyle(
  //               fontFamily: 'BalooChettan2',
  //               fontSize: 36,
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Positioned(
  //         top: -20,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: List.generate(
  //             3,
  //             (index) => Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 5),
  //               child: Image.asset(
  //                 'assets/images/victorystar.png',
  //                 width: 40,
  //                 height: 40,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget buildTitle(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/pitabeforestartgame.png',
          width: 306.0,
          height: 91.4,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Text(
            'Menang!',
            style: TextStyle(
              fontFamily: 'BalooChettan 2',
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }


  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Skor',
          style: TextStyle(
            fontFamily: 'BalooChettan2',
            fontSize: 20,
            color: Color(0xFFFF6B00),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 113,
          height: 27,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B00),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            score.toString(),
            style: const TextStyle(
              fontFamily: 'BalooChettan2',
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Hadiah',
          style: TextStyle(
            fontFamily: 'BalooChettan2',
            fontSize: 20,
            color: Color(0xFFFF6B00),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coins_200.png',
              height: 34.17,
              width: 46.83,
            ),
            const SizedBox(width: 10),
            Text(
              coins.toString(),
              style: const TextStyle(
                fontFamily: 'BalooChettan2',
                fontSize: 18,
                color: Color(0xFF8B4513),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: onClose,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF8B4513),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'Kembali',
              style: TextStyle(
                fontFamily: 'BalooChettan2',
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  AlertDialog buildDialog(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero, // Remove default title padding
      title: SizedBox.shrink(), // Remove the default title space
      backgroundColor: Colors.white, // Ensure this is set
      contentPadding: EdgeInsets.only(top: 60.0), // Adjust content padding
      content: buildContent(context),
      actions: buildActions(context),
    );
  }

  @override
Widget build(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none, // Ensure content can overflow
    alignment: Alignment.center,
    children: [
      // Background overlay
      Positioned.fill(
        child: GestureDetector(
          onTap: onClose,
          child: Container(
            color: Colors.black54, // Semi-transparent background
          ),
        ),
      ),
      // Dialog content
      Positioned(
        top: MediaQuery.of(context).size.height / 4,
        child: Stack(
          clipBehavior: Clip.none, // Ensure title can overflow
          alignment: Alignment.topCenter,
          children: <Widget>[
            // Main dialog box
            Container(
              width: 306.0, // Set the desired width
              height: 332.0, // Set the desired height
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the entire dialog
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60), // Add space for the floating title
                  buildContent(context), // Custom content widget
                  ...buildActions(context), // Custom actions
                ],
              ),
            ),
            // Floating title widget
            Positioned(
              top: -50, // Adjust this value for the "3D" floating effect
              child: buildTitle(context),
            ),
          ],
        ),
      ),
    ],
  );
}
}