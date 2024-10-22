import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class StudentMainScreenPage extends StatefulWidget {
  @override
  State<StudentMainScreenPage> createState() =>
      StudentMainScreenPageWidgetState();
}

class StudentMainScreenPageWidgetState extends State<StudentMainScreenPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Text(
              'Minha Conta',
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: [
                Text(
                  'R\$100.00',
                  style: TextStyle(color: Colors.grey[800]),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: HeroIcon(
                    _obscureText ? HeroIcons.eye : HeroIcons.eyeSlash,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
