import 'package:equatable/equatable.dart';

abstract class ProfessorProfileEvent extends Equatable {
  const ProfessorProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfessorProfileEvent extends ProfessorProfileEvent {}
