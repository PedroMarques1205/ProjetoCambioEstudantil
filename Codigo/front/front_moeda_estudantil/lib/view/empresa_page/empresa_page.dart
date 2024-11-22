import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/login_page/login_page.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/widgets/user_info_widget.dart';
import 'package:heroicons/heroicons.dart';
import '../../viewmodel/empresa_bloc/empresa_bloc.dart';
import '../../viewmodel/empresa_bloc/empresa_event.dart';
import '../../viewmodel/empresa_bloc/empresa_state.dart';
import '../../domain/vantagem/vantagem_service.dart'; // Certifique-se de importar o VantagemService corretamente.
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/vantagem/dtos/vantagem_dto.dart';
import '../../domain/vantagem/client/vantagem_client.dart';

class EmpresaPage extends StatefulWidget {
  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  late final EmpresaBloc _empresaBloc;
  final TextEditingController _searchController = TextEditingController();
  List<VantagemDTO> vantagens = [];
  bool isLoading = false;

  @override
void initState() {
  super.initState();

  // Defina o baseUrl do seu servidor backend.
  const String baseUrl = 'https://seu-servidor.com';

  // Instância do VantagemClient com baseUrl.
  final vantagemClient = VantagemClient(baseUrl: baseUrl);

  // Criação do EmpresaBloc com VantagemService.
  _empresaBloc = EmpresaBloc(VantagemService(vantagemClient));

  // Escutando os estados do Bloc.
  _empresaBloc.stream.listen((state) {
    if (state is EmpresaLoaded) {
      setState(() {
        vantagens = state.vantagens;
        isLoading = false;
      });
    } else if (state is EmpresaError) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  });
}

  void _buscarVantagens() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    _empresaBloc.add(FetchVantagensEvent(query));
  }

  @override
  Widget build(BuildContext context) {
    // Código do build permanece o mesmo.
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      UserInfoWidget(
                        user: Context.currentUser,
                        top: 18,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                labelText: 'Digite o nome ou CNPJ',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _buscarVantagens,
                            child: Text('Buscar Minhas Vantagens'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      isLoading
                          ? CircularProgressIndicator()
                          : vantagens.isEmpty
                              ? Text('Nenhuma vantagem encontrada.')
                              : Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.0,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                    ),
                                    itemCount: vantagens.length,
                                    itemBuilder: (context, index) {
                                      final vantagem = vantagens[index];
                                      return Card(
                                        color: Colors.white,
                                        elevation: 4,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                vantagem.nome,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 1),
                                              Text(
                                                  'Custo: ${vantagem.custo} Moedas'),
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
              ],
            ),
            Center(
              child: Column(
                children: [
                  Divider(color: Colors.grey[300]),
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
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          icon:
                              HeroIcon(HeroIcons.arrowRightOnRectangle),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[300]),
                ],
              ),
            ),
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

  @override
  void dispose() {
    _empresaBloc.close();
    _searchController.dispose();
    super.dispose();
  }
}
