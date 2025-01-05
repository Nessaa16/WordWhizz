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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.asset('assets/images/silangnyahati.png'),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      // Tambahkan ini
      child: Column(
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
                    'Kamu telah kehabisan nyawa. Tolong isi kembali nyawamu untuk melanjutkan bermain',
                    style: TextStyle(
                      fontFamily: 'BalooChettan 2',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.1, // Pastikan nilai height sesuai
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
              child: const Text(
                'Beli',
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
      titlePadding: EdgeInsets.zero,
      title: SizedBox.shrink(),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.only(top: 60.0),
      content: buildContent(context),
      actions: buildActions(context),
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
                height: 332.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
