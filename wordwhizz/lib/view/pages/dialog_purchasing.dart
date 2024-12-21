part of 'pages.dart';

class DialogPurchasing extends StatefulWidget {
  final String title;
  final String message;
  final String imagePath;

  const DialogPurchasing({
    Key? key,
    this.title = "Konfirmasi",
    this.message = "Apakah kamu yakin ingin membeli nyawa \"Full\"?",
    this.imagePath = 'assets/images/heart_full.png', // Default image
  }) : super(key: key);

  @override
  State<DialogPurchasing> createState() => _DialogPurchasingState();

  static void showDialogPurchasing(BuildContext context,
      {String? title, String? message, String? imagePath}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DialogPurchasing(
        title: title ?? "Konfirmasi",
        message: message ?? "Apakah kamu yakin ingin membeli nyawa \"Full\"?",
        imagePath: imagePath ?? 'assets/images/heart_full.png', 
      ),
    );
  }
}

class _DialogPurchasingState extends State<DialogPurchasing> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Main content container
          Container(
            margin: const EdgeInsets.only(top: 40), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'BalooChettan2',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8B4513), 
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFF7600), 
                        width: 10,
                      ),
                    ),
                    child: Image.asset(
                      widget.imagePath, 
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset(
                            'assets/images/button_kembali.png',
                            width: 166.33,
                            height: 58.17,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16), 
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(true),
                          child: Image.asset(
                            'assets/images/button_beli.png',
                            width: 166.33,
                            height: 58.17,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          
          Positioned(
            top: -20,
            child: Image.asset(
              'assets/images/label_konfirmasi.png',
              width: 280,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  static void showDialogPurchasing(BuildContext context,
      {String? title, String? message, String? imagePath}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DialogPurchasing(
        // default message
        title: title ?? "Konfirmasi",
        message: message ?? "Apakah kamu yakin ingin membeli nyawa \"Full\"?",
        imagePath: imagePath ?? 'assets/images/heart_full.png', 
      ),
    );
  }
}
