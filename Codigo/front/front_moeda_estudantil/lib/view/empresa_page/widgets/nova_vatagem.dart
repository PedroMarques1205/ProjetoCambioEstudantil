import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_bloc.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_event.dart';
import '../../../viewmodel/nova_vantagem/nova_vantagem_state.dart';

class NovaVantagemPage extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
            SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail da Empresa Provedora',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                BlocConsumer<NovaVantagemBloc, NovaVantagemState>(
                  listener: (context, state) {
                    if (state is NovaVantagemSuccess) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Vantagem salva com sucesso!')),
                      );
                    } else if (state is NovaVantagemFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NovaVantagemLoading) {
                      return CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        final titulo = _tituloController.text.trim();
                        final descricao = _descricaoController.text.trim();
                        final valor = _valorController.text.trim();
                        final email = _emailController.text.trim();

                        if (titulo.isEmpty || descricao.isEmpty || valor.isEmpty || email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Todos os campos são obrigatórios!')),
                          );
                          return;
                        }

                        BlocProvider.of<NovaVantagemBloc>(context).add(
                          SalvarNovaVantagemEvent(
                            titulo: titulo,
                            descricao: descricao,
                            valor: valor,
                            email: email,
                          ),
                        );
                      },
                      child: Text('Salvar'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
