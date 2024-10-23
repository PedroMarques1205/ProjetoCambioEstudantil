import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAluno = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color(0xFF069E8C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAluno ? const Color(0xFF99DB49) : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isAluno = true; 
                      });
                    },
                    child: const Text('Aluno'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAluno ? Colors.grey : const Color(0xFF99DB49),
                    ),
                    onPressed: () {
                      setState(() {
                        isAluno = false; 
                      });
                    },
                    child: const Text('Empresa'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), 

            if (isAluno) ...[
              const Text('Cadastro de Aluno', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildTextField('Nome'),
              _buildTextField('Email'),
              _buildTextField('CPF'),
              _buildTextField('RG'),
              _buildTextField('Endereço'),
              _buildTextField('Instituição de Ensino'),
              _buildTextField('Curso'),
            ] else ...[
              const Text('Cadastro de Empresa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildTextField('CNPJ'),
              _buildTextField('Senha'),
            ],
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cadastro realizado com sucesso!')),
                );
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
