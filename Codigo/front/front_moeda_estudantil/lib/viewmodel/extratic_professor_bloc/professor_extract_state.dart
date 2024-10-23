import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/extratic_professor/dtos/extratic_professor_dto.dart';

abstract class ProfessorExtractState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfessorExtractInitial extends ProfessorExtractState {}

class ProfessorExtractLoading extends ProfessorExtractState {}

class ProfessorExtractLoaded extends ProfessorExtractState {
  final List<EnvioMoedaDTO> envios;

  ProfessorExtractLoaded({required this.envios});

  @override
  List<Object> get props => [envios];
}

class ProfessorExtractError extends ProfessorExtractState {
  final String error;

  ProfessorExtractError({required this.error});

  @override
  List<Object> get props => [error];
}
