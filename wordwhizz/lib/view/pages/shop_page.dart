part of 'pages.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

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
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Ensure proper alignment
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle back navigation
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
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center horizontally
                        children: [
                          _buildSection(
                            'Koin',
                            [
                              _buildItem('200', 'IDR 25K',
                                  'assets/images/coins_200.png'),
                              _buildItem('400', 'IDR 50K',
                                  'assets/images/coins_400.png'),
                              _buildItem('600', 'IDR 75K',
                                  'assets/images/coins_600.png'),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Nyawa',
                            [
                              _buildItem('Full', '100 koin',
                                  'assets/images/heart.png'),
                              _buildItem(
                                  '4', '50 koin', 'assets/images/hearts_4.png'),
                              _buildItem(
                                  '2', '25 koin', 'assets/images/hearts_2.png'),
                            ],
                          ),
                          SizedBox(height: 47),
                          _buildSection(
                            'Paket',
                            [
                              _buildItem('Pemula', '50 koin',
                                  'assets/images/bundlePemula.png'),
                              _buildItem('Elit', '100 koin',
                                  'assets/images/bundleElit.png'),
                              _buildItem('Sultan', '200 koin',
                                  'assets/images/bundleSultan.png'),
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
                          // Fungsi saat tombol ditekan
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
    return SizedBox(
      width: 342,
      height: 214,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cardShopPage.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String price, String imagePath) {
    return Container(
      width: 85,
      height: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/shopPage_whiteCard.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/button_green.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              imagePath,
              height: 40,
            ),
          ),
          
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
