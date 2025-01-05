part of 'pages.dart';

class BeforeGameAlertDialog extends StatelessWidget
    implements BaseCustomDialog {
  final String levelNumber;
  final VoidCallback onClose;
  final List<Potion> potions;
  final String currentHeartCount;

  const BeforeGameAlertDialog({
    Key? key,
    required this.levelNumber,
    required this.onClose,
    required this.potions,
    required this.currentHeartCount,
  }) : super(key: key);

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
            'Tahap $levelNumber',
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
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Bantu dengan ramuan',
                  style: TextStyle(
                    fontFamily: 'BalooChettan 2',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var potion in potions)
                    GestureDetector(
                      onTap: () {
                        potion.toggleSelection();
                        (context as Element)
                            .markNeedsBuild(); // Rebuild the widget
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 45.59,
                              height: 41,
                              decoration: BoxDecoration(
                                color: potion.selected
                                    ? Colors.yellow
                                    : Colors.white,
                                border: Border.all(
                                  color: potion.selected
                                      ? Colors.red
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                potion.image,
                                width: 19,
                                height: 31,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              potion.quantity.toString(),
                              style: const TextStyle(
                                fontFamily: 'BalooChettan 2',
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
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
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 166.13,
            height: 58.17,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  final docSnapshot = await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .get();
                  if (docSnapshot.exists) {
                    final userData = docSnapshot.data();
                    if (userData != null) {
                      int currentLives = userData['lives'] ?? 0;
                      if (currentLives > 0) {
                        _reduceLives(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Splashscreen(
                              navigateTo: StoryPage(),
                            ),
                          ),
                        );
                      } else {
                        // Show NoHeartAlertDialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => NoHeartAlertDialog(
                            onClose: () => Navigator.of(context).pop(),
                            onBuyHearts: () {
                              // Implement logic to buy hearts
                              // For example, navigate to a store page
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      }
                    }
                  }
                }
              },
              child: const Text(
                'Mulai',
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

  void _reduceLives(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch the latest user data from Firebase
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (docSnapshot.exists) {
        final userData = docSnapshot.data();
        if (userData != null) {
          int currentLives =
              userData['lives'] ?? 0; // Ensure this is fetched from Firebase
          int newLives = currentLives - 2;

          // Ensure the newLives value doesn't go below 0
          if (newLives < 0) {
            newLives = 0;
          }

          // Update lives in Firebase
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'lives': newLives,
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoryPage()),
          );
        }
      }
    }
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
                    const SizedBox(
                        height: 60), // Add space for the floating title
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
