import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const PasswordInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: true, // Torna o texto invisível
        decoration: InputDecoration(
          labelText: 'Senha',
          border: OutlineInputBorder(),
          hintText: 'Digite sua senha',
        ),
      ),
    );
  }
}
