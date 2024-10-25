import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/main_screen_page/main_screen_page.dart';
import 'package:front_moeda_estudantil/view/shared/password_input.dart'
    as password_input;
import 'package:front_moeda_estudantil/viewmodel/bloc_login_page/login_page_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/bloc_login_page/login_page_event.dart';
import 'package:front_moeda_estudantil/viewmodel/bloc_login_page/login_page_state.dart';
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

  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LoginBloc();
  }

  void _toggleEmpresaLogin() {
    setState(() {
      isEmpresaLogin = !isEmpresaLogin;
      emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger(
            child: Text(state.error),
          );
        }
        if (state is LoginSuccess) {
          if (Context.currentUser.type == 'ENTERPRISE') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EmpresaPage(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreenPage(),
              ),
            );
          }
        }
      },
      builder: (context, state) {
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
                          'Câmbio Estudantil',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                          ),
                        ),
                        Text(
                          'A recompensa imediata dos seus esforços!',
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
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: emailController,
                    keyboardType: isEmpresaLogin
                        ? TextInputType.number
                        : TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: isEmpresaLogin ? 'CPF' : 'Email',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: password_input.PasswordInput(
                      controller: passwordController),
                ),
                const SizedBox(height: 10),
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
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey[800],
                        backgroundColor: CambioColors.greenPrimary,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () {
                      _bloc.add(DoLoginEvent(
                          usuario: emailController.text,
                          senha: passwordController.text));
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: CambioColors.greenPrimary,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: const Text('Cadastre-se'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
