import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/nova_vantegem/client/nova_vantagem_client.dart';
import 'package:front_moeda_estudantil/domain/nova_vantegem/nova_vantagem_service.dart';
import 'package:front_moeda_estudantil/domain/vantagem/client/vantagem_client.dart';
import 'package:front_moeda_estudantil/domain/vantagem/vantagem_service.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_state.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_bloc.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_event.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_state.dart';

class NovaVantagemPage extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final EmpresaBloc _bloc =
      EmpresaBloc(VantagemService(VantagemClient(Context.dio)));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmpresaBloc, EmpresaState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nova Vantagem',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _tituloController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: 'Valor (Moedas)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final titulo = _tituloController.text.trim();
                        final descricao = _descricaoController.text.trim();
                        final valor = _valorController.text.trim();
                        final email = _emailController.text.trim();

                        _bloc.add(
                          SalvarNovaVantagemEvent(
                            titulo: titulo,
                            descricao: descricao,
                            valor: valor,
                            email: email,
                          ),
                        );
                      },
                      child: Text('Salvar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
