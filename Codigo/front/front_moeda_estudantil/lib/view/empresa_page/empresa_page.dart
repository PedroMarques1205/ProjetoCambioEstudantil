import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/vantagem/dtos/vantagem_dto.dart';
import 'package:front_moeda_estudantil/domain/vantagem/vantagem_service.dart';
import 'package:front_moeda_estudantil/domain/vantagem/client/vantagem_client.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/empresa_page/widgets/nova_vatagem.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_event.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_state.dart';
import 'package:front_moeda_estudantil/view/login_page/login_page.dart';
import 'package:heroicons/heroicons.dart';

class EmpresaPage extends StatefulWidget {
  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  final TextEditingController _searchController = TextEditingController();
  late EmpresaBloc _empresaBloc;
  List<VantagemDTO> vantagens = [];

  @override
  void initState() {
    super.initState();
    _empresaBloc = EmpresaBloc(VantagemService(VantagemClient(Context.dio)));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _empresaBloc.close();
    super.dispose();
  }

  bool _isValidCNPJ(String cnpj) {
    return cnpj.length == 14 && int.tryParse(cnpj) != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmpresaBloc, EmpresaState>(
      bloc: _empresaBloc,
      listener: (context, state) {
        if (state is VantagensLoaded) {
          setState(() {
            vantagens = state.vantagens;
          });
        }
      },
      builder: (context, state) {
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
              bottom: TabBar(
                labelColor: CambioColors.greenSecondary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: CambioColors.greenSecondary,
                tabs: [
                  Tab(
                    icon:
                        HeroIcon(HeroIcons.home, style: HeroIconStyle.outline),
                    text: 'Home',
                  ),
                  Tab(
                    icon: HeroIcon(HeroIcons.cog6Tooth,
                        style: HeroIconStyle.outline),
                    text: 'Config',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Digite o CNPJ da empresa',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          final cnpj = _searchController.text;
                          if (cnpj.isEmpty || !_isValidCNPJ(cnpj)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('CNPJ inválido.')),
                            );
                          } else {
                            _empresaBloc.add(FetchVantagensEvent(cnpj));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CambioColors.greenSecondary,
                        ),
                        child: Text('Buscar Minhas Vantagens'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return NovaVantagemPage();
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CambioColors.greenSecondary,
                        ),
                        child: Text('Nova vantagem'),
                      ),
                      if (state is VantagensLoading)
                        CircularProgressIndicator(),
                      if (vantagens.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: vantagens.length,
                            itemBuilder: (context, index) {
                              final vantagem = vantagens[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                elevation: 5,
                                child: ListTile(
                                  title: Text(vantagem.titulo ?? '-'),
                                  subtitle: Text(vantagem.descricao ?? '-'),
                                  trailing:
                                      Text('R\$ ${vantagem.valor.toString()}'),
                                ),
                              );
                            },
                          ),
                        ),
                      if (vantagens.isEmpty && !(state is VantagensLoading))
                        Text(
                          'Nenhuma vantagem encontrada.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Divider(color: Colors.grey[300]),
                      ListTile(
                        title: Text(
                          'Sair',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          icon: HeroIcon(HeroIcons.arrowRightOnRectangle),
                        ),
                      ),
                      Divider(color: Colors.grey[300]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
