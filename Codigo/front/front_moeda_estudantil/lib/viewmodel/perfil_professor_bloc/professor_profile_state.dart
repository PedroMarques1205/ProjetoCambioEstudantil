import 'package:equatable/equatable.dart';

abstract class ProfessorProfileState extends Equatable {
  const ProfessorProfileState();

  @override
  List<Object> get props => [];
}

class ProfessorProfileLoading extends ProfessorProfileState {}

class ProfessorProfileLoaded extends ProfessorProfileState {
  final String nome;
  final String cpf;
  final String departamento;

  ProfessorProfileLoaded({required this.nome, required this.cpf, required this.departamento});

  @override
  List<Object> get props => [nome, cpf, departamento];
}

class ProfessorProfileError extends ProfessorProfileState {
  final String message;

  ProfessorProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
