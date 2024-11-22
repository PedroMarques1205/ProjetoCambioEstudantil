import 'package:flutter_bloc/flutter_bloc.dart';
import 'empresa_event.dart';
import 'empresa_state.dart';
import '../../domain/vantagem/vantagem_service.dart';

class EmpresaBloc extends Bloc<EmpresaEvent, EmpresaState> {
  final VantagemService service;

  EmpresaBloc(this.service) : super(EmpresaInitial()) {
    on<FetchVantagensEvent>((event, emit) async {
      emit(EmpresaLoading());
      try {
        final vantagens = await service.fetchVantagens(event.nomeOuCnpj);
        emit(EmpresaLoaded(vantagens));
      } catch (e) {
        emit(EmpresaError('Erro ao buscar vantagens: $e'));
      }
    });
  }
}
