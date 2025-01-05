part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.selectedCharacter});

  final String selectedCharacter;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String birthdate = "";
  int userAge = 0;
  bool isLoading = true;
  String? selectedCharacterImage;

  final List<Map<String, String>> _characters = [
    {
      'name': 'Tikus Ksatria',
      'image': 'assets/images/tikus.png',
    },
    {
      'name': 'Kucing Penyihir',
      'image': 'assets/images/kucing.png',
    },
    {
      'name': 'Kerbau Pejuang',
      'image': 'assets/images/kerbau.png',
    },
    {
      'name': 'Rubah Pemanah',
      'image': 'assets/images/rubah.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          final selectedCharacterName = userData['selectedCharacter'] ?? "";

          // Cari jalur gambar berdasarkan karakter yang dipilih
          final character = _characters.firstWhere(
            (char) => char['name'] == selectedCharacterName,
            orElse: () => {'image': 'assets/images/default_avatar.png'},
          );

          setState(() {
            username = userData['username'] ?? "";
            birthdate = userData['birthdate'] ?? "";
            userAge = _calculateAge(birthdate);
            selectedCharacterImage = character['image'];
            isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        username = "Error loading data";
        isLoading = false;
      });
      print("Error fetching user data: $e");
    }
  }

  int _calculateAge(String birthdate) {
    try {
      final birthDate = DateFormat("dd/MM/yyyy").parse(birthdate);
      final today = DateTime.now();
      int age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age;
    } catch (e) {
      print("Error parsing birthdate: $e");
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5BCEFF),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                                Navigator.pop(context);
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
                                fontFamily: 'BalooChettan2',
                                fontSize: 48,
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
                            child: selectedCharacterImage != null
                                ? Image.asset(selectedCharacterImage!)
                                : Image.asset('assets/images/default_avatar.png'),
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
                            borderRadius: BorderRadius.circular(40),
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
                              // Nama Pengguna
                              Text(
                                username,
                                style: TextStyle(
                                  fontFamily: 'BalooChettan2',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown[700],
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Umur Pengguna
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$userAge years old',
                                    style: const TextStyle(
                                      fontFamily: 'BalooChettan2',
                                      fontSize: 20,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      print('Edit icon pressed');
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ],
                              ),

                              // Stats
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildStat('Level', '1'),
                                  const SizedBox(width: 24),
                                  _buildStat('Exp', '110/800'),
                                  const SizedBox(width: 24),
                                  _buildStat('Chapter', '1'),
                                ],
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
            fontFamily: 'BalooChettan2',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'BalooChettan2',
            fontSize: 20,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
