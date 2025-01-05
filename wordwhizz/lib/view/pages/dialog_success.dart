part of 'pages.dart';

class DialogSuccess extends StatelessWidget {
  final String category;
  final String title;
  final VoidCallback onClose;

  const DialogSuccess({
    Key? key,
    required this.category,
    required this.title,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget buildTitle(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/pitabeforestartgame.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 40,
          child: Material(
            type: MaterialType.transparency,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontFamily: 'BalooChettan2',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text(
                'Berhasil!',
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Changed from spaceEvenly to start
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Material(
              type: MaterialType.transparency,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'BalooChettan2',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                child: Text(
                  'Kamu berhasil membeli $category "$title"!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/images/animations/Payment.json',
              width: 300,
              height: 150,
              repeat: false,
            ),
          ),
          Container(
            width: 166.13,
            height: 58.17,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/button1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: TextButton(
              onPressed: onClose,
              child: Material(
                type: MaterialType.transparency,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontFamily: 'BalooChettan2',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Kembali',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onClose,
            child: Container(
              color: Colors.black54,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 306.0,
                height: 380.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    buildContent(context),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: buildTitle(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}