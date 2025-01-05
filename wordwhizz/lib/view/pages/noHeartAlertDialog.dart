part of 'pages.dart';

class NoHeartAlertDialog extends StatelessWidget implements BaseCustomDialog {
  // kalau tidak ada hati, alert ini yang dipanggil
  final VoidCallback onClose;
  final VoidCallback onBuyHearts;

  const NoHeartAlertDialog(
      {Key? key, required this.onClose, required this.onBuyHearts})
      : super(key: key);

  @override
  Widget buildTitle(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/hatimerah.png',
          width: 92,
          height: 91.32,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.asset('assets/images/silangnyahati.png'),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 223,
          height: 130,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Kamu telah kehabisan nyawa. Tolong isi kembali nyawamu '
                  'untuk melanjutkan bermain',
                  style: TextStyle(
                    fontFamily: 'BalooChettan 2',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            width: 166.13,
            height: 58.17,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: TextButton(
              onPressed: onClose,
              child: const Text(
                'Kembali',
                style: TextStyle(
                  fontFamily: 'BalooChettan 2',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
          children:<Widget>[
            // Main dialog box
            Container(
              width :306.0, // Set the desired width
              height :332.0, // Set the desired height
              decoration :BoxDecoration (
                color :Colors.white, // Background color for the entire dialog
                borderRadius :BorderRadius.circular (20.0),
              ),
              child :Column (
                mainAxisAlignment :MainAxisAlignment.start,
                children:<Widget>[
                  const SizedBox (height :60), // Add space for the floating title
                  buildContent (context), // Custom content widget
                  ...buildActions (context), // Custom actions
                ],
              ),
            ),
            // Floating title widget
            Positioned (
              top :-50, // Adjust this value for the "3D" floating effect
              child :buildTitle (context),
            ),
          ],
        ),
      ),
    ],
  );
}
}