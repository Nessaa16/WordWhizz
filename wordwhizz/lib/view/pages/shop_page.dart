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
            '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/bgShopPage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.arrow_back_ios, color: Colors.orange),
                      ),
                      Spacer(),
                      // Coins
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Image.asset('/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/coin.png', height: 24),
                            SizedBox(width: 4),
                            Text('350', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      // Hearts
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 4),
                            Text('8', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Title
                Text(
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
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Koin Section
                        _buildSection(
                          'Koin',
                          [
                            _buildItem('200', 'IDR 25K', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/coins_200.png'),
                            _buildItem('400', 'IDR 50K', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/coins_400.png'),
                            _buildItem('600', 'IDR 75K', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/coins_600.png'),
                          ],
                        ),
                        
                        SizedBox(height: 16),
                        
                        // Nyawa Section
                        _buildSection(
                          'Nyawa',
                          [
                            _buildItem('Full', '100 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/heart.png'),
                            _buildItem('4', '50 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/hearts_4.png'),
                            _buildItem('2', '25 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/hearts_2.png'),
                          ],
                        ),
                        
                        SizedBox(height: 16),
                        
                        // Paket Section
                        _buildSection(
                          'Paket',
                          [
                            _buildItem('Pemula', '50 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/bundlePemula.png'),
                            _buildItem('Elit', '100 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/bundleElit.png'),
                            _buildItem('Sultan', '200 koin', '/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/bundleSultan.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Gacha Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Gacha',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('/Users/marshandagwie/development/projects_flutter/WordWhizz/wordwhizz/assets/images/cardShopPage.png'),
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
    );
  }

  Widget _buildItem(String title, String price, String imagePath) {
    return Container(
      width: 90,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 40),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

