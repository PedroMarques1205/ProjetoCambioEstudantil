import 'package:equatable/equatable.dart';

abstract class ProfessorExtractEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProfessorExtract extends ProfessorExtractEvent {}
