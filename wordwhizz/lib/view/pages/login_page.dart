part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlUsername = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHide = true;

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
               
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 220,
                  ),
                ),
                SizedBox(height: 20),

                // Title
                Text(
                  "Masuk",
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

                // Profile Form
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),

                    // Nama Pengguna
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      height: 80,
                      child: TextFormField(
                        controller: ctrlUsername,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return (value == null || value.isEmpty)
                              ? "Nama Pengguna tidak boleh kosong!"
                              : null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Nama Pengguna",
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
                          labelText: "Kata Sandi",
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
                              isHide ? Icons.visibility : Icons.visibility_off,
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
                    SizedBox(height: 30),

                    // Submit Button
                     Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 70,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets
                                      .zero,
                                  backgroundColor: Colors
                                      .transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        0),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Splashscreen(
                                        navigateTo: CharacterPage(selectedCharacter: '',), //home screen harusnya
                                      ),
                                      ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/button1.png',
                                      height: 70,
                                    ),
                                    Positioned(
                                      child: Text("Masuk", style: button1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
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
