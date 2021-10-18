import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const LoginTextField({
    Key? key,
   required this.label,
     required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border:const OutlineInputBorder(),
        ),
      ),
    );
  }
}
