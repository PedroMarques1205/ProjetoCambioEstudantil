import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/widgets/user_info_widget.dart';

class EmpresaPage extends StatefulWidget {
  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  final List<Map<String, dynamic>> produtos = [];

  String nome = "Nome da Empresa";
  String email = "email@empresa.com";
  String cnpj = "12.345.678/0001-99";
  String senha = "********";

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UserInfoWidget(user: Context.currentUser),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: produtos.length,
                    itemBuilder: (context, index) {
                      final produto = produtos[index];
                      return Card(
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              produto['nome'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 1),
                            Text('Custo: ${produto['custo']} Moedas'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            left: 16,
            child: GestureDetector(
              onTap: _showAddProdutoDialog,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
