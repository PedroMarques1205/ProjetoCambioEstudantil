import 'package:flutter/material.dart';

import 'package:front_moeda_estudantil/view/student_main_screen_page/student_main_screen_page.dart';

class MainScreenPage extends StatefulWidget {
  @override
  State<MainScreenPage> createState() => MainScreenPageWidgetState();
}

class MainScreenPageWidgetState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: MainStudentPage()),
    );
  }
}
