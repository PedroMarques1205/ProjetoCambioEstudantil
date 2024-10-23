import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'professor_profile_event.dart';
import 'professor_profile_state.dart';

class ProfessorProfileBloc extends Bloc<ProfessorProfileEvent, ProfessorProfileState> {
  ProfessorProfileBloc() : super(ProfessorProfileLoading());

  @override
  Stream<ProfessorProfileState> mapEventToState(ProfessorProfileEvent event) async* {
    if (event is FetchProfessorProfileEvent) {
      yield ProfessorProfileLoading();
      try {
        final response = await http.get(Uri.parse('https://api.example.com/professor'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          yield ProfessorProfileLoaded(
            nome: data['nome'],
            cpf: data['cpf'],
            departamento: data['departamento'],
          );
        } else {
          yield ProfessorProfileError(message: 'Erro ao carregar os dados do professor');
        }
      } catch (e) {
        yield ProfessorProfileError(message: 'Erro de conexão: $e');
      }
    }
  }
}
