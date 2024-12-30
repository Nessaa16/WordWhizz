part of 'pages.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final audioPlayer = AudioPlayer();

  Future<void> _purchaseItem(String category, String title) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception("Pengguna tidak ditemukan. Silakan login kembali.");
    }

    final userRef = _firestore.collection('users').doc(userId);

    final userData = await userRef.get();
    if (!userData.exists) {
      throw Exception("Data pengguna tidak ditemukan.");
    }

    final currentData = userData.data() ?? {};
    int currentCoins = currentData['coins'] ?? 0;
    int currentLives = currentData['lives'] ?? 0;

    if (category == 'koin') {
      if (title == '200') currentCoins += 200;
      if (title == '400') currentCoins += 400;
      if (title == '600') currentCoins += 600;
    } else if (category == 'nyawa') {
      if (title == '10' && currentCoins >= 100) {
        currentCoins -= 100;
        currentLives += 10; 
      } else if (title == '4' && currentCoins >= 50) {
        currentCoins -= 50;
        currentLives += 4;
      } else if (title == '2' && currentCoins >= 25) {
        currentCoins -= 25;
        currentLives += 2;
      } else {
        throw Exception("Koin tidak cukup untuk membeli nyawa \"$title\".");
      }
    }

    await userRef.update({
      'coins': currentCoins,
      'lives': currentLives,
    });

    await _firestore.collection('purchases').add({
      'userId': userId,
      'category': category,
      'title': title,
      'timestamp': FieldValue.serverTimestamp(),
    });
    _playBuyingSound();
   showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogSuccess(
          category: category,
          title: title,
          onClose: () {
            Navigator.pop(context); 
          },
        );
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal membeli item: ${e.toString()}')),
    );
  }
}

Future<void> _playBuyingSound() async {
  try {
    await audioPlayer.setSource(AssetSource('sounds/buying.mp3'));
    await audioPlayer.resume();
  } catch (e) {
    print('Error playing buying sound: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/bgShopPage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  TopNavbar(
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        'Toko & Gacha',
                        style: TextStyle(
                          fontFamily: 'BalooChettan2',
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Sections
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildSection(
                            'Koin',
                            [
                              _buildItem('200', 'IDR 25K', 'assets/images/coins_200.png', 'koin'),
                              _buildItem('400', 'IDR 50K', 'assets/images/coins_400.png', 'koin'),
                              _buildItem('600', 'IDR 75K', 'assets/images/coins_600.png', 'koin'),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Nyawa',
                            [
                              _buildItem('10', '100 koin', 'assets/images/heart_full.png', 'nyawa'),
                              _buildItem('4', '50 koin', 'assets/images/hearts_4.png', 'nyawa'),
                              _buildItem('2', '25 koin', 'assets/images/hearts_2.png', 'nyawa'),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Paket',
                            [
                              _buildItem('Pemula', '50 koin', 'assets/images/bundlePemula.png', 'paket'),
                              _buildItem('Elit', '100 koin', 'assets/images/bundleElit.png', 'paket'),
                              _buildItem('Sultan', '200 koin', 'assets/images/bundleSultan.png', 'paket'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Gacha Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GachaPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/button_gacha.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 166.33,
                          height: 58.17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 342,
          height: 214,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cardShopPage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'BalooChettan2',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: items,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(String title, String price, String imagePath, String category) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // WhiteCard
        Container(
          width: 85,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/shopPage_whiteCard.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Image
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image.asset(
                  imagePath,
                  height: 40,
                ),
              ),
              // Title
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'BalooChettan2',
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -16,
          left: 9.5,
          child: GestureDetector(
            onTap: () {
              DialogPurchasing.showDialogPurchasing(
                context,
                title: "Konfirmasi Pembelian",
                message: "Apakah kamu yakin ingin membeli $category \"$title\"?",
                imagePath: imagePath,
                onConfirm: () => _purchaseItem(category, title),
              );
            },
            child: Container(
              width: 66,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/button_green.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'BalooChettan2',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
