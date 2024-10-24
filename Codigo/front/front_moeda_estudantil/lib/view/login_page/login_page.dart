import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/shared/email_input.dart';
import 'package:front_moeda_estudantil/view/shared/password_input.dart'
    as password_input;
import '../professor_main_screen_page/professor_main_screen_page.dart';
import '../student_main_screen_page/student_main_screen_page.dart';
import '../register_page/register_page.dart';
import '../empresa_page/empresa_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmpresaLogin = false;

  void _toggleEmpresaLogin() {
    setState(() {
      isEmpresaLogin = !isEmpresaLogin;
      emailController.clear(); // Clear the field when toggling
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: CambioColors.darkPrimary,
              child: const Padding(
                padding: EdgeInsets.only(top: 60, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in to your Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      'Use your credentials to login',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                keyboardType: isEmpresaLogin
                    ? TextInputType.number // CPF requires a numeric input
                    : TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: isEmpresaLogin ? 'CPF' : 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  password_input.PasswordInput(controller: passwordController),
            ),
            const SizedBox(height: 10),

            // Toggle between Email/CPF
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: _toggleEmpresaLogin,
                  child: Text(
                    isEmpresaLogin
                        ? 'Logar como aluno/professor'
                        : 'Logar como empresa',
                    style: TextStyle(
                      color: CambioColors.greenPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey[800],
                  backgroundColor: CambioColors.greenPrimary,
                ),
                onPressed: () {
                  if (isEmpresaLogin) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmpresaPage(),
                      ),
                    );
                  } else {
                    // Assuming the default is student/professor login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentMainScreenPage(),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: CambioColors.greenPrimary,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                child: Text('Cadastre-se'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
