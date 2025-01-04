part of 'pages.dart';

class DialogWin extends StatelessWidget {
  final int skor;
  final int hadiah;
  final VoidCallback onClose;

  const DialogWin({
    Key? key,
    required this.skor,
    required this.hadiah,
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
          top: -100,
          child: Image.asset(
            'assets/images/stars.png',
            width: 140,
            height: 140,
          ),
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
                'Menang!',
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          type: MaterialType.transparency,
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'BalooChettan2',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            child: Text(
              'Skor',
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40, 4, 40, 4),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: 'BalooChettan2',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    child: Text(
                      '$skor',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/coins_200.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 8),
                  Material(
                    type: MaterialType.transparency,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontFamily: 'BalooChettan2',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                      child: Text(
                        '$hadiah',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
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
        ),
      ),
    ];
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
                height: 332.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    buildContent(context),
                    ...buildActions(context),
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