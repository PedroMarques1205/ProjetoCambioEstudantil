import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Bloc imports
import '../../viewmodel/perfil_professor_bloc/perfil_professor_bloc.dart';
import '../../viewmodel/perfil_professor_bloc/professor_profile_event.dart';
import '../../viewmodel/perfil_professor_bloc/professor_profile_state.dart';

class ProfessorProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfessorProfileBloc()..add(FetchProfessorProfileEvent()),
      child: Scaffold(
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
          child: BlocBuilder<ProfessorProfileBloc, ProfessorProfileState>(
            builder: (context, state) {
              if (state is ProfessorProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfessorProfileLoaded) {
                return Column(
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
                    _buildInfoCard('Nome:', state.nome),
                    _buildInfoCard('CPF:', state.cpf),
                    _buildInfoCard('Departamento:', state.departamento),
                  ],
                );
              } else if (state is ProfessorProfileError) {
                return Center(
                  child: Text('Erro ao carregar informações: ${state.message}'),
                );
              }
              return Container();
            },
          ),
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
