import 'package:flutter/material.dart';

class ProfessorExtractPage extends StatelessWidget {
  final List<EnvioMoeda> envios = [
    EnvioMoeda(matricula: '123456', quantidade: 10, motivo: 'Bom desempenho em sala.'),
    EnvioMoeda(matricula: '789012', quantidade: 5, motivo: 'Participação em projeto.'),
    EnvioMoeda(matricula: '345678', quantidade: 20, motivo: 'Ajuda em trabalho em grupo.'),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato de Envio de Moedas'),
        backgroundColor: const Color(0xFF069E8C), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
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
        ),
      ),
    );
  }
}


class EnvioMoeda {
  final String matricula;
  final int quantidade;
  final String motivo;

  EnvioMoeda({
    required this.matricula,
    required this.quantidade,
    required this.motivo,
  });
}
