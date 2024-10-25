import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/student_main_screen_page.dart';
import 'package:heroicons/heroicons.dart';

class MensalidadePage extends StatefulWidget {
  @override
  _MensalidadePageState createState() => _MensalidadePageState();
}

class _MensalidadePageState extends State<MensalidadePage> {
  double mensalidade = 1800.00;
  double desconto = 0;
  double valorFinal = 1800.00;
  double? descontoSelecionado;
  bool isSaldoVisible = false;

  final List<double> porcentagens = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

  void aplicarDesconto(double porcentagem) {
    setState(() {
      if (descontoSelecionado == porcentagem) {
        descontoSelecionado = null;
        desconto = 0;
        valorFinal = mensalidade;
      } else {
        descontoSelecionado = porcentagem;
        desconto = porcentagem;
        valorFinal = mensalidade - (mensalidade * porcentagem / 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double saldo = Context.currentUser.saldoMoedas ?? 0;
    bool saldoInsuficiente =
        saldo < (mensalidade * (descontoSelecionado ?? 0) / 100);

    return Scaffold(
      backgroundColor: CambioColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CambioColors.backgroundColor,
        title: Text(
          'Mensalidade',
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainStudentPage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: CambioColors.greenSecondary,
            )),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainStudentPage(),
                  ),
                );
              },
              child: Text(
                'Aplicar',
                style: TextStyle(color: CambioColors.greenSecondary),
              ))
        ],
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
                    isSaldoVisible
                        ? 'R\$${Context.currentUser.saldoMoedas}'
                        : '****',
                    style: TextStyle(
                      color: CambioColors.darkGray,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSaldoVisible = !isSaldoVisible;
                      });
                    },
                    icon: HeroIcon(
                      isSaldoVisible ? HeroIcons.eye : HeroIcons.eyeSlash,
                      color: CambioColors.darkGray,
                    ),
                  )
                ],
              ),
            ),
          ),
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
                    "Com o SmartCoin, você pode ganhar até 50% de desconto na mensalidade! Suas moedas viram desconto, e você escolhe o valor. Só lembre: ao reduzir o desconto, as moedas usadas não voltam.",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: porcentagens.length,
                      itemBuilder: (context, index) {
                        double porcentagem = porcentagens[index];
                        bool isSelected = descontoSelecionado == porcentagem;
                        bool isDisabled = saldoInsuficiente && !isSelected;
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: isDisabled
                                ? null
                                : () {
                                    aplicarDesconto(porcentagem);
                                  },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? CambioColors.greenSecondary
                                        .withOpacity(0.2)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: isDisabled
                                      ? Colors.grey[400]!
                                      : (isSelected
                                          ? CambioColors.greenSecondary
                                          : Colors.grey[400]!),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${porcentagem.toInt()}%',
                                    style: TextStyle(
                                      color: isDisabled
                                          ? Colors.grey
                                          : (isSelected
                                              ? CambioColors.greenSecondary
                                              : Colors.grey[600]),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (isSelected)
                                    HeroIcon(
                                      HeroIcons.checkCircle,
                                      color: CambioColors.greenSecondary,
                                    )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
