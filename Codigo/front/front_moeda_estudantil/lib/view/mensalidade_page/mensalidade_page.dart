import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:heroicons/heroicons.dart';

class MensalidadePage extends StatefulWidget {
  @override
  _MensalidadePageState createState() => _MensalidadePageState();
}

class _MensalidadePageState extends State<MensalidadePage> {
  double mensalidade = 1800.00;
  double desconto = 0;
  double valorFinal = 1800.00;

  final List<double> porcentagens = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

  void aplicarDesconto(double porcentagem) {
    setState(() {
      desconto = porcentagem;
      valorFinal = mensalidade - (mensalidade * porcentagem / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CambioColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CambioColors.backgroundColor,
        title: Text(
          'Mensalidade',
          style: TextStyle(color: Colors.grey[800]),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: CambioColors.greenSecondary,
            )),
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey[300]),
          Padding(
            padding: const EdgeInsets.all(23),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 0.5, color: CambioColors.darkGray),
              ),
              child: Row(
                children: [
                  Text(
                    'Saldo disponível',
                    style: TextStyle(
                        color: CambioColors.darkGray,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    'R\$${Context.currentUser.saldoMoedas}',
                    style: TextStyle(
                      color: CambioColors.darkGray,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: HeroIcon(
                      HeroIcons.eyeSlash,
                      color: CambioColors.darkGray,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 23, left: 23),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sua mensalidade:',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'R\$${mensalidade.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 25,
                          decoration: desconto > 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (desconto > 0)
                        Text(
                          'R\$${valorFinal.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: CambioColors.greenSecondary,
                            fontSize: 25,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Selecione o desconto:',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: porcentagens.length,
                    itemBuilder: (context, index) {
                      double porcentagem = porcentagens[index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: desconto == porcentagem
                              ? CambioColors.greenSecondary
                              : Colors.grey[300],
                          foregroundColor: desconto == porcentagem
                              ? Colors.white
                              : Colors.grey[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          aplicarDesconto(porcentagem);
                        },
                        child: Text(
                          '$porcentagem%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
