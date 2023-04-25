import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  String? Function(String?)? validator;
  final String? name;

  MyTextFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
