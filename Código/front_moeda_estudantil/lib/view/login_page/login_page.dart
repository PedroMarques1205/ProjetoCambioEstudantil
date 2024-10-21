import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/shared/button_widget.dart';
import 'package:front_moeda_estudantil/view/shared/email_input.dart';
import 'package:front_moeda_estudantil/view/shared/password_input.dart';

class LoginPage extends StatelessWidget {
  
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
                        'Sign in to your Account',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            EmailInput(),
            PasswordInput(),
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ButtonWidget(
                  backgroundColor: CambioColors.greenPrimary,
                  textColor: Colors.grey[800]!,
                  text: 'Login',
                  borderColor: CambioColors.greenPrimary,
                  onTap: () {}),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ButtonWidget(
                  backgroundColor: Colors.white,
                  textColor: CambioColors.greenPrimary,
                  text: 'Cadastre-se',
                  borderColor: CambioColors.greenPrimary,
                  onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
