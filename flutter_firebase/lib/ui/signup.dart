import 'package:learn_auth/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signin(context),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 50,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const Center(
                  child: Text('Daftar Akun'),
                ),
                const SizedBox(
                  height: 80,
                ),
                _emailInput(),
                const SizedBox(
                  height: 20,
                ),
                _passwordInput(),
                const SizedBox(
                  height: 50,
                ),
                _signupButton(context),
              ],
            ),
          ),
        ));
  }

  Widget _emailInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alamat Email'),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _emailController,
        )
      ],
    );
  }

  Widget _passwordInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password'),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _passwordInputController,
          obscureText: true,
        )
      ],
    );
  }

  Widget _signupButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
      ),
      onPressed: () async {
        await AuthService().signup(
            email: _emailController.text,
            password: _passwordInputController.text,
            context: context);
      },
      child: const Text(
        "Daftar",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
              text: "Sudah Punya Akun? ",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            TextSpan(
                text: "Masuk",
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 50, 67),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
          ])),
    );
  }
}