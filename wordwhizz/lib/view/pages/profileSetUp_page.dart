part of 'pages.dart';

class ProfilesetupPage extends StatefulWidget {
  const ProfilesetupPage({super.key});

  @override
  _ProfilesetupPageState createState() => _ProfilesetupPageState();
}

class _ProfilesetupPageState extends State<ProfilesetupPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlUsername = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlDate = TextEditingController();
  bool isHide = true;
  int _currentIndex = 2;

  Future<void> _registerUser() async {
    if (_loginKey.currentState?.validate() ?? false) {
      try {
        // Create a new user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: ctrlEmail.text,
          password: ctrlPass.text,
        );

        // Add user details to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'username': ctrlUsername.text,
          'email': ctrlEmail.text,
          'birthdate': ctrlDate.text,
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Akun berhasil dibuat!")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Splashscreen(
              navigateTo: CharacterPage(selectedCharacter: ''),
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bgsplash2.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 220,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Mengatur Profil",
                  style: TextStyle(
                    fontFamily: 'BalooChettan2',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Form(
                  key: _loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      // Username Field
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        height: 80,
                        child: TextFormField(
                          controller: ctrlUsername,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Pengguna tidak boleh kosong!";
                            }
                            if (value.length < 3) {
                              return "Nama Pengguna harus terdiri dari minimal 3 karakter!";
                            }
                            final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
                            if (!usernameRegex.hasMatch(value)) {
                              return "Nama Pengguna hanya boleh berisi huruf, angka, dan underscore!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Masukkan Nama Pengguna",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 24,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Email Field
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        height: 80,
                        child: TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong!";
                            }
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            if (!emailRegex.hasMatch(value)) {
                              return "Masukkan Email yang valid!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Masukkan Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 24,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Password Field
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        height: 80,
                        child: TextFormField(
                          obscureText: isHide,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: ctrlPass,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Masukkan Kata Sandi",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHide = !isHide;
                                });
                              },
                              child: Icon(
                                color: Colors.grey,
                                size: 24,
                                isHide
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return value!.length < 6
                                ? "Kata Sandi harus berisi minimal 6 kata"
                                : null;
                          },
                        ),
                      ),

                      // Birthdate Field
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        height: 80,
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime(1900), // Earliest selectable date
                              lastDate:
                                  DateTime.now(), // Latest selectable date
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Color.fromARGB(
                                          255, 50, 44, 97), // Header color
                                      onPrimary:
                                          Colors.white, // Header text color
                                      onSurface:
                                          Colors.black, // Body text color
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              setState(() {
                                ctrlDate.text =
                                    formattedDate; // Update the controller with the selected date
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: ctrlDate,
                              keyboardType: TextInputType.datetime,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return (value == null || value.isEmpty)
                                    ? "Tanggal Lahir tidak boleh kosong!"
                                    : null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "DD/MM/YYYY",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(Icons.calendar_month_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      // Submit Button
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 70,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              elevation: 0,
                            ),
                            onPressed: _registerUser,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/button1.png',
                                  height: 70,
                                ),
                                Positioned(
                                  child: Text("Daftar", style: button1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
