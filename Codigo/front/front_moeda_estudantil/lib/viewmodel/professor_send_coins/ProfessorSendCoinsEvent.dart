import 'package:equatable/equatable.dart';

abstract class ProfessorSendCoinsEvent extends Equatable {
  const ProfessorSendCoinsEvent();

  @override
  List<Object> get props => [];
}

class SendCoinsButtonPressed extends ProfessorSendCoinsEvent {
  final String matricula;
  final String quantidade;
  final String motivo;

  const SendCoinsButtonPressed({required this.matricula, required this.quantidade, required this.motivo});

  @override
  List<Object> get props => [matricula, quantidade, motivo];
}
