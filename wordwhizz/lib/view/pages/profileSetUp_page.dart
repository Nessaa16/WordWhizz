part of 'pages.dart';

class ProfilesetupPage extends StatefulWidget {
  const ProfilesetupPage({super.key});

  @override
  _ProfilesetupPageState createState() => _ProfilesetupPageState();
}

class _ProfilesetupPageState extends State<ProfilesetupPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlUsername = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlDate = TextEditingController();
  bool isHide = true;
  int _currentIndex = 2;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Color.fromARGB(255, 50, 44, 97)
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30),

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

                    // Tanggal Lahir Field
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      height: 80,
                      child: TextFormField(
                        controller: ctrlDate,
                        keyboardType: TextInputType.datetime,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return (value == null || value.isEmpty)
                              ? "Tanggal Lahir tidak boleh kosong!"
                              : null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Tanggal Lahir",
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
                    SizedBox(height: 30),

                    // Submit Button
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterPage(),
                              ),
                            );
                          },
                          child: Text("Daftar", style: button1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            elevation: 10,
                            shadowColor: secondaryColor,
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
