import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;

  CustomTextFormField({
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
    required this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 55.0,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1B25),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          prefixIcon: Icon(prefixIcon, color: Colors.white70),
        ),
        validator: validator,
      ),
    );
  }
}

message(BuildContext context, String message, String tipo,
    {bool redirect = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: tipo == 'success' ? Colors.green : Colors.red));
  redirect ? Navigator.popAndPushNamed(context, 'home') : null;
}
