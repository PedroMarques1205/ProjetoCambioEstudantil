import 'package:equatable/equatable.dart';

abstract class ProfessorSendCoinsState extends Equatable {
  const ProfessorSendCoinsState();

  @override
  List<Object> get props => [];
}

class ProfessorSendCoinsInitial extends ProfessorSendCoinsState {}

class ProfessorSendCoinsLoading extends ProfessorSendCoinsState {}

class ProfessorSendCoinsSuccess extends ProfessorSendCoinsState {}

class ProfessorSendCoinsFailure extends ProfessorSendCoinsState {
  final String error;

  const ProfessorSendCoinsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
