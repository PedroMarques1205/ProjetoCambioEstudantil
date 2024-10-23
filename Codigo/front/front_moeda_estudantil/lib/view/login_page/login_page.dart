import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/shared/email_input.dart';
import 'package:front_moeda_estudantil/view/shared/password_input.dart' as password_input;
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
  final TextEditingController cnpjController = TextEditingController();
  String selectedRole = '';

  void _selectRole(String role) {
    setState(() {
      selectedRole = role;
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
                          fontSize: 35),
                    ),
                    Text(
                      'Select your role to login',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (selectedRole == 'Aluno' || selectedRole == 'Professor') 
              EmailInput(controller: emailController),
            if (selectedRole == 'Aluno' || selectedRole == 'Professor')
              password_input.PasswordInput(controller: passwordController),
            if (selectedRole == 'Empresa') 
              TextField(
                controller: cnpjController,
                decoration: InputDecoration(
                  labelText: 'CNPJ',
                  border: OutlineInputBorder(),
                ),
              ),
            if (selectedRole == 'Empresa') 
              password_input.PasswordInput(controller: passwordController),
            if (selectedRole == 'Aluno' || selectedRole == 'Professor' || selectedRole == 'Empresa')
              const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _selectRole('Aluno'),
                  child: Text('Aluno'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRole == 'Aluno'
                        ? CambioColors.greenPrimary
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectRole('Professor'),
                  child: Text('Professor'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRole == 'Professor'
                        ? CambioColors.greenPrimary
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectRole('Empresa'),
                  child: Text('Empresa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRole == 'Empresa'
                        ? CambioColors.greenPrimary
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {}, 
                child: Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                      color: CambioColors.greenPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey[800], 
                  backgroundColor: CambioColors.greenPrimary, 
                ),
                onPressed: () {
                  if (selectedRole == 'Aluno') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentMainScreenPage(),
                      ),
                    );
                  } else if (selectedRole == 'Professor') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfessorMainScreenPage(),
                      ),
                    );
                  } else if (selectedRole == 'Empresa') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmpresaPage(), 
                      ),
                    );
                  }
                },
                child: Text(
                  'Login como ${selectedRole.isEmpty ? '...' : selectedRole}',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
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
