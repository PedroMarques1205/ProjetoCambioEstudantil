import 'package:flutter/material.dart';
import './view/login_page/login_page.dart';
import './view/professor_main_screen_page/professor_main_screen_page.dart';
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
        '/': (context) => LoginPage(), // Página de login
        '/student': (context) => StudentMainScreenPage(), // Página do aluno
        '/professor': (context) => ProfessorMainScreenPage(), // Página do professor
      },
    );
  }
}