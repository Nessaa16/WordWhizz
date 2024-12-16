part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required String selectedCharacter});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5BCEFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Teks "Profile" di atas
                Stack(
                  children: [
                    // Tombol Back menggunakan GestureDetector dan gambar
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context); // Navigasi ke halaman sebelumnya
                        },
                        child: Image.asset(
                          'assets/images/backarrow.png', // Path gambar
                          width: 40, // Lebar gambar
                          height: 40, // Tinggi gambar
                          fit: BoxFit.contain, // Mengatur gambar sesuai ukuran
                        ),
                      ),
                    ),
                    // Teks "Profile" di tengah
                    Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 155,
                      height: 163,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/avatar_dog.png', // Ganti dengan path gambar Anda
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Profile Info
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Depede Swangar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      const Text(
                        '14 years old',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Stats Row
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat('Level', '15'),
                      _buildStat('Exp', '1221/2000'),
                      _buildStat('Chapter', '2'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Achievements Section
                const Text(
                  'Achievement',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 20),

                // Achievement Cards
                _buildAchievementCard(
                  'Genius People',
                  'You have completed this lesson 10 times.',
                  Colors.purple.shade200,
                  Icons.emoji_events,
                ),
                const SizedBox(height: 10),
                _buildAchievementCard(
                  'No Buff-Buff Club',
                  'You have completed this lesson 10 times without any buff.',
                  Colors.lightGreen,
                  Icons.person,
                ),
                const SizedBox(height: 10),
                _buildAchievementCard(
                  'Speedrunner',
                  'You have completed this lesson 10 times without any buff.',
                  Colors.amber,
                  Icons.timer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.brown,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(
      String title, String description, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
