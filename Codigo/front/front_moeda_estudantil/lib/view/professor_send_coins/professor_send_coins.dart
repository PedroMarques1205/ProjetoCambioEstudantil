import 'package:flutter/material.dart';

class ProfessorSendCoins extends StatelessWidget {
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enviar Moedas'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            TextField(
              controller: matriculaController,
              decoration: const InputDecoration(
                labelText: 'Matrícula do Aluno',
              ),
            ),
            TextField(
              controller: quantidadeController,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Moedas',
                hintText: 'Insira a quantidade',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: motivoController,
              decoration: const InputDecoration(
                labelText: 'Motivo do Envio',
              ),
              maxLines: 3, 
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            String matricula = matriculaController.text;
            String quantidade = quantidadeController.text;
            String motivo = motivoController.text;

            // lógica para enviar as moedas

            Navigator.of(context).pop();
          },
          child: const Text('Enviar Moedas'),
        ),
      ],
    );
  }
}
