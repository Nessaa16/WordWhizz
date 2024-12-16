part of 'pages.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/backarrow.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Spacer(),
                        // Coins
                        Container(
                          width: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/coin.png', height: 24),
                              SizedBox(width: 4),
                              Text('350',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        // Hearts
                        Container(
                          width: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/heart.png',
                                  height: 24),
                              SizedBox(width: 4),
                              Text('8',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Text(
                        'Toko & Gacha',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(0.3),
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
                              _buildItem('200', 'IDR 25K',
                                  'assets/images/coins_200.png', () {
                                print('200 coins purchased');
                              }),
                              _buildItem('400', 'IDR 50K',
                                  'assets/images/coins_400.png', () {
                                print('400 coins purchased');
                              }),
                              _buildItem('600', 'IDR 75K',
                                  'assets/images/coins_600.png', () {
                                print('600 coins purchased');
                              }),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Nyawa',
                            [
                              _buildItem('Full', '100 koin',
                                  'assets/images/heart_full.png', () {
                                print('Full heart purchased');
                              }),
                              _buildItem(
                                  '4', '50 koin', 'assets/images/hearts_4.png',
                                  () {
                                print('4 hearts purchased');
                              }),
                              _buildItem(
                                  '2', '25 koin', 'assets/images/hearts_2.png',
                                  () {
                                print('2 hearts purchased');
                              }),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Paket',
                            [
                              _buildItem('Pemula', '50 koin',
                                  'assets/images/bundlePemula.png', () {
                                print('Pemula package purchased');
                              }),
                              _buildItem('Elit', '100 koin',
                                  'assets/images/bundleElit.png', () {
                                print('Elit package purchased');
                              }),
                              _buildItem('Sultan', '200 koin',
                                  'assets/images/bundleSultan.png', () {
                                print('Sultan package purchased');
                              }),
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
                          print('Gacha button pressed');
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cardShopPage.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: items,
              ),
            ],
          ),
        ),
        if (title == 'Koin')
          Positioned(
            bottom: -125,
            left: -35,
            child: Transform.rotate(
              angle: -0.1,
              child: Image.asset(
                'assets/images/mascott.png',
                height: 151,
                width: 158,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildItem(
      String title, String price, String imagePath, VoidCallback onTap) {
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
            onTap: onTap,
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
