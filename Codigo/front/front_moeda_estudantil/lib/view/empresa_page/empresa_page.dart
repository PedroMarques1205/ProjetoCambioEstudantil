import 'package:flutter/material.dart';

class EmpresaPage extends StatefulWidget {
  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  final List<Map<String, dynamic>> produtos = [];

  void _addProduto(String nome, int custo) {
    setState(() {
      produtos.add({'nome': nome, 'custo': custo});
    });
  }

  void _showAddProdutoDialog() {
    String nome = '';
    int custo = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastrar Novo Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome da Vantagem'),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Custo em Moedas'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  custo = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nome.isNotEmpty && custo > 0) {
                  _addProduto(nome, custo);
                  Navigator.of(context).pop(); 
                }
              },
              child: Text('Adicionar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página da Empresa'),
        backgroundColor: const Color(0xFF069E8C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  final produto = produtos[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(produto['nome']),
                      subtitle: Text('Custo: ${produto['custo']} Moedas'),
                      leading: Icon(Icons.star), 
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: _showAddProdutoDialog,
              child: Card(
                color: Colors.transparent,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 48,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
