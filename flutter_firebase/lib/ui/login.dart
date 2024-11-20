import 'package:learn_auth/ui/signup.dart';
import 'package:learn_auth/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _signupText(context),
      appBar: AppBar(
      title: const Text('Belajar Auth'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Hello, Silahkan masuk',
                ),
              ),
              const SizedBox(height: 80,),
               _emailInput(),
               const SizedBox(height: 20,),
               _password(),
               const SizedBox(height: 50,),
               _signinButton(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _emailInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alamat Email'),
        const SizedBox(height: 16,),
        TextField(
          controller: _emailController,
        )
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password'),
        const SizedBox(height: 16,),
        TextField(
          obscureText: true,
          controller: _passwordController,
        )
      ],
    );
  }

  Widget _signinButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
      ),
      onPressed: () async {
        await AuthService().signin(
          email: _emailController.text,
          password: _passwordController.text,
          context: context
        );
      },
      child: const Text("Masuk", style: TextStyle(color: Colors.white),),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
                text: "Pengguna Baru? ",
                style: TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 16
                ),
              ),
              TextSpan(
                text: "Daftar",
                style: const TextStyle(
                    color: Color.fromARGB(255, 1, 40, 113),
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup()
                      ),
                    );
                  }
              ),
          ]
        )
      ),
    );
  }
}