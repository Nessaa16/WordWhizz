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
                
                Stack(
                  children: [
                    
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context); // Navigasi ke halaman sebelumnya
                        },
                        child: Image.asset(
                          'assets/images/backarrow.png', 
                          width: 40, 
                          height: 40, 
                          fit: BoxFit.contain, 
                        ),
                      ),
                    ),
                    
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
                        'assets/images/avatar_dog.png', 
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Profile Info
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(40), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Profile Info
                        Column(
                          children: [
                            Text(
                              'Depede Swangar',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, 
                              children: [
                                const Text(
                                  '14 years old',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                                const SizedBox(
                                    width: 8), 
                                GestureDetector(
                                  onTap: () {
                                    // Tambahkan fungsi edit 
                                    print('Edit icon pressed');
                                  },
                                  child: const Icon(
                                    Icons.edit, // Ikon edit
                                    size: 20, 
                                    color: Colors.brown, 
                                  ),
                                ),
                              ],
                            ),

                            // Garis Pembatas
                            const SizedBox(height: 8),
                            Center(
                              child: Container(
                                width: 234,
                                height: 1,
                                color: Color(
                                    0xFFD3D2D2), 
                              ),
                            ),

                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, 
                              children: [
                                _buildStat('Level', '15'),
                                const SizedBox(
                                    width:
                                        24), 
                                _buildStat('Exp', '1221/2000'),
                                const SizedBox(
                                    width:
                                        24), 
                                _buildStat('Chapter', '2'),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Garis Pembatas 
                        Center(
                          child: Container(
                            width: 234,
                            height: 1,
                            color: Color(
                                0xFFD3D2D2), 
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Achievements Section
                        const Center(
                          child: Text(
                            'Achievement',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Achievement Cards
                        _buildAchievementCard(
                          'Genius People',
                          'You have completed this lesson 10 times.',
                          const Color(0xFFAD79EB),
                          'assets/images/achieve_genius.png', 
                        ),
                        const SizedBox(height: 10),
                        _buildAchievementCard(
                          'No Buff-Buff Club',
                          'You have completed this lesson 10 times without any buff.',
                          const Color(0xFFA7EC3A),
                          'assets/images/achieve_nobuff.png', 
                        ),
                        const SizedBox(height: 10),
                        _buildAchievementCard(
                          'Speedrunner',
                          'You have completed this lesson 10 times without any buff.',
                          const Color(0xFFFFDE00),
                          'assets/images/achieve_speedrunner.png', 
                        ),
                      ],
                    ),
                  ),
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
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(
      String title, String description, Color color, String imagePath) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(45),
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
            padding: const EdgeInsets.all(1),
            child: Image.asset(
              imagePath, 
              width: 66, 
              height: 66, 
              fit: BoxFit.cover,
            ),
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
