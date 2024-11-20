import 'package:learn_auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Anda Berhasil Masuk'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email!.toString(),
                ),
                const SizedBox(
                  height: 30,
                ),
                _logoutButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
      ),
      onPressed: () async {
        await AuthService().signout(context: context);
      },
      child: const Text(
        "Keluar",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}