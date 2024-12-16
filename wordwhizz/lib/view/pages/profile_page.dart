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
      backgroundColor: Color(0xFF5BCEFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Back Button and Title
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Membuat elemen dalam Row rata tengah
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/backarrow.png', // Ganti dengan path gambar yang sesuai
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                        width:
                            40), // Spacer untuk menyeimbangkan ruang di kanan
                  ],
                ),
                const SizedBox(height: 20),

                // Profile Avatar
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/avatar_dog.png', // Replace with the correct path to your asset image
                  ),
                ),
                const SizedBox(height: 20),

                // Profile Info
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
