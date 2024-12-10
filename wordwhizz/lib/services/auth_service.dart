import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Attempt to sign in the user
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If successful, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!")),
      );

      // TODO: Navigate to the home screen or another page
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
         case 'nama pengguna-sedang-digunakan':
        errorMessage = "Nama pengguna ini sudah terpakai.";
        break;
      case 'email-sedang-digunakan':
        errorMessage = "Email ini sudah terpakai.";
        break;
      case 'password-lemah':
        errorMessage = "Password terlalu lemah.";
        break;
      default:
        errorMessage = "Terjadi error: ${e.message}";
      }

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi Error: ${e.toString()}")),
      );
    }
  }

 Future<void> signup({
  required String username,
  required String email,
  required String password,
  required BuildContext context,
}) async {
  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Email dan kata sandi tidak boleh kosong.")),
    );
    return;
  }

  // Validate email format
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (!emailRegex.hasMatch(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Tolong masukkan email yang valid.")),
    );
    return;
  }

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Akun berhasil dibuat!")),
    );

    // TODO: Navigate to another screen after signup
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'nama pengguna-sedang-digunakan':
        errorMessage = "Nama pengguna ini sudah terpakai.";
        break;
      case 'email-sedang-digunakan':
        errorMessage = "Email ini sudah terpakai.";
        break;
      case 'password-lemah':
        errorMessage = "Password terlalu lemah.";
        break;
      default:
        errorMessage = "Terjadi error: ${e.message}";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Terjadi error: ${e.toString()}")),
    );
  }
}

  // Sign out
  Future<void> signout(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Berhasil keluar.")),
      );

      // TODO: Navigate back to the login screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi error: ${e.toString()}")),
      );
    }
  }

  // Check if user is logged in
  User? get currentUser => _firebaseAuth.currentUser;
}
