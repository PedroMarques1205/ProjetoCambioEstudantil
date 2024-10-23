import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodel/professor_send_coins/ProfessorSendCoinsBloc.dart';
import '../../viewmodel/professor_send_coins/ProfessorSendCoinsState.dart';
import '../../viewmodel/professor_send_coins/ProfessorSendCoinsEvent.dart';

class ProfessorSendCoins extends StatelessWidget {
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfessorSendCoinsBloc, ProfessorSendCoinsState>(
      listener: (context, state) {
        if (state is ProfessorSendCoinsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Moedas enviadas com sucesso!')),
          );
          Navigator.of(context).pop(); // Fecha o pop-up
        } else if (state is ProfessorSendCoinsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro: ${state.error}')),
          );
        }
      },
      child: AlertDialog(
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
          BlocBuilder<ProfessorSendCoinsBloc, ProfessorSendCoinsState>(
            builder: (context, state) {
              if (state is ProfessorSendCoinsLoading) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  final matricula = matriculaController.text;
                  final quantidade = quantidadeController.text;
                  final motivo = motivoController.text;

                  if (matricula.isNotEmpty && quantidade.isNotEmpty && motivo.isNotEmpty) {
                    context.read<ProfessorSendCoinsBloc>().add(
                      SendCoinsButtonPressed(
                        matricula: matricula,
                        quantidade: quantidade,
                        motivo: motivo,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Preencha todos os campos!')),
                    );
                  }
                },
                child: const Text('Enviar Moedas'),
              );
            },
          ),
        ],
      ),
    );
  }
}
