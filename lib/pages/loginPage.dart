import 'package:e_music/providers/auth_provider.dart';
import 'package:e_music/widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FuturisticLoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  void _submit(BuildContext context, String user, String password) async {
    final loginProvider = Provider.of<AuthService>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      final response =
          await loginProvider.signInWithEmailAndPassword(user, password);
      // if (response) {
      // ignore: use_build_context_synchronously
      message(context, 'Login successful', 'success', redirect: true);
      // } else {
      // ignore: use_build_context_synchronously
      //   message(context, 'Usuario incorrecto', 'error');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0C0027), Color(0xFF96005E)],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80.0),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FaIcon(
                    FontAwesomeIcons.headphones,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextFormField(
                  controller: _usernameController,
                  hintText: 'Username',
                  prefixIcon: Icons.person_outline,
                  // validator: Validators.validateUsername,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateUsername,
                ),
                const SizedBox(height: 20.0),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  // validator: Validators.validatePassword,
                  keyboardType: TextInputType.text,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: 280.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => _submit(context, _usernameController.text,
                        _passwordController.text),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
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
}
