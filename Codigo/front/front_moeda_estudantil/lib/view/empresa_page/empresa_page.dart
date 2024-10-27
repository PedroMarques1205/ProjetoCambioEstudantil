import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/login_page/login_page.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/widgets/user_info_widget.dart';
import 'package:heroicons/heroicons.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CambioColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            'Bem-vindo(a), ${Context.currentUser.nome ?? ''}!',
            style: TextStyle(
              color: CambioColors.greenSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: CambioColors.backgroundColor,
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Divider(
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      UserInfoWidget(
                        user: Context.currentUser,
                        top: 18,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                              color: Colors.white,
                              elevation: 4,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      produto['nome'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 1),
                                    Text('Custo: ${produto['custo']} Moedas'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 590,
                  left: 20,
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
            Center(
                child: Column(
              children: [
                Divider(
                  color: Colors.grey[300],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        'Sair',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          icon: HeroIcon(HeroIcons.arrowRightOnRectangle))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                ),
              ],
            )),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: CambioColors.greenSecondary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: CambioColors.greenSecondary,
          tabs: [
            Tab(
              icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.outline),
              text: 'Home',
            ),
            Tab(
              icon: HeroIcon(HeroIcons.cog6Tooth, style: HeroIconStyle.outline),
              text: 'Config',
            ),
          ],
        ),
      ),
    );
  }
}
