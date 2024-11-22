import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_moeda_estudantil/view/student_list_page/student_list_page_widget.dart';
import './view/login_page/login_page.dart';
import './view/student_main_screen_page/student_main_screen_page.dart';
import '../../domain/vantagem/vantagem_service.dart';
import '../../domain/vantagem/client/vantagem_client.dart';
import '../../domain/context/context.dart';
import '../../viewmodel/empresa_bloc/empresa_bloc.dart';

import '../../view/empresa_page/widgets/nova_vatagem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EmpresaBloc>(
          create: (_) =>
              EmpresaBloc(VantagemService(VantagemClient(Context.dio))),
        ),
      ],
      child: MaterialApp(
        title: 'Sistema Escolar',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/student': (context) => MainStudentPage(),
          '/studentList': (context) => StudentListPageWidget(),
          '/novaVantagem': (context) => NovaVantagemPage(),
        },
      ),
    );
  }
}
