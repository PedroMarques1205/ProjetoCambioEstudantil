import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodel/extratic_professor_bloc/professor_extract_bloc.dart';
import '../../viewmodel/extratic_professor_bloc/professor_extract_state.dart';
import '../../viewmodel/extratic_professor_bloc/professor_extract_event.dart';

class ProfessorExtractPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato de Envio de Moedas'),
        backgroundColor: const Color(0xFF069E8C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ProfessorExtractBloc, ProfessorExtractState>(
          builder: (context, state) {
            if (state is ProfessorExtractLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfessorExtractLoaded) {
              final envios = state.envios;
              return ListView.builder(
                itemCount: envios.length,
                itemBuilder: (context, index) {
                  final envio = envios[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Matrícula: ${envio.matricula}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Quantidade de Moedas: ${envio.quantidade}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Motivo: ${envio.motivo}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProfessorExtractError) {
              return Center(
                child: Text('Erro: ${state.error}'),
              );
            }
            return const Center(child: Text('Nenhum dado disponível.'));
          },
        ),
      ),
    );
  }
}
