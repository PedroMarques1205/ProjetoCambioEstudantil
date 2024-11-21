import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/view/student_list_page/student_list_page_widget.dart';
import './view/login_page/login_page.dart';
import './view/student_main_screen_page/student_main_screen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Escolar',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/student': (context) => MainStudentPage(),
        '/studentList': (context) => StudentListPageWidget(),
      },
    );
  }
}
