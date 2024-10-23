import 'package:flutter_bloc/flutter_bloc.dart';
import 'professor_extract_event.dart';
import 'professor_extract_state.dart';
import '../../domain/extratic_professor/extratic_professor_service.dart';
import '../../domain/extratic_professor/dtos/extratic_professor_dto.dart';

class ProfessorExtractBloc extends Bloc<ProfessorExtractEvent, ProfessorExtractState> {
  final ExtractService extractService;

  ProfessorExtractBloc({required this.extractService}) : super(ProfessorExtractInitial()) {
    on<LoadProfessorExtract>(_onLoadProfessorExtract);
  }

  void _onLoadProfessorExtract(
    LoadProfessorExtract event,
    Emitter<ProfessorExtractState> emit,
  ) async {
    emit(ProfessorExtractLoading());

    try {
      final envios = await extractService.fetchProfessorExtract();
      emit(ProfessorExtractLoaded(envios: envios));
    } catch (error) {
      emit(ProfessorExtractError(error: error.toString()));
    }
  }
}
