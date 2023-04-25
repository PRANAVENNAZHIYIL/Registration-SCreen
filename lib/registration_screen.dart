import 'package:flutter/material.dart';
import 'package:registrtion_screen/sucess_Screen.dart';
import 'package:registrtion_screen/widgets/passwordformfield.dart';
import 'package:registrtion_screen/widgets/textformfield.dart';

class RegistrationScren extends StatefulWidget {
  const RegistrationScren({super.key});

  @override
  State<RegistrationScren> createState() => _RegistrationScrenState();
}

class _RegistrationScrenState extends State<RegistrationScren> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool obserText = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Registration successful, do something here
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const SucessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyTextFormField(
                  controller: _emailController,
                  name: "email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
                PasswordTextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      List<String> errors = [];

                      if (value!.isEmpty) {
                        errors.add('Please enter a password\n');
                      }
                      if (value.length < 8) {
                        errors.add(
                            'Password must contain at least 8 characters\n');
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        errors
                            .add('Password must contain an uppercase letter\n');
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        errors
                            .add('Password must contain a lowercase letter\n');
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        errors.add('Password must contain a number\n');
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        errors.add('Password must contain a special character');
                      }

                      return errors.toString();
                    },
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        obserText = !obserText;
                      });
                    },
                    name: "password",
                    obserText: obserText),
                PasswordTextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        obserText = !obserText;
                      });
                    },
                    name: "confirm password",
                    obserText: obserText),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Register'),
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
