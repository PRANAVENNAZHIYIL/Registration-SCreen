import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool? obserText;
  final TextEditingController? controller;
  final String? name;
  String? Function(String?)? validator;

  final Function()? onTap;
  PasswordTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.onTap,
    required this.name,
    required this.obserText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obserText!,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
