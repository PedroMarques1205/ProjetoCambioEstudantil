import 'package:flutter/material.dart';
import '../perfil_professor_page/perfil_professor_page.dart';

class ProfessorProfilePage extends StatelessWidget {
  final String nome = "João da Silva"; 
  final String cpf = "123.456.789-00"; 
  final String departamento = "Matemática"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Professor'),
        backgroundColor: const Color(0xFF069E8C), 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Container(
        color: Colors.white, 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text(
              'Informações Pessoais',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20), 
            _buildInfoCard('Nome:', nome),
            _buildInfoCard('CPF:', cpf),
            _buildInfoCard('Departamento:', departamento),
          ],
        ),
      ),
    );
  }

 
  Widget _buildInfoCard(String label, String value) {
    return Card(
      elevation: 4, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0), 
      child: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.end, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
