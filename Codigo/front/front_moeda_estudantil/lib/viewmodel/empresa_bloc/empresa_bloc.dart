import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/user/user_service.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_event.dart';
import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_state.dart';

class EmpresaDetalhesBloc extends Bloc<EmpresaDetalhesEvent, EmpresaDetalhesState> {
  UserService service = UserService();
  
  EmpresaDetalhesBloc() : super(EmpresaDetalhesInitState()) {
    on<EmpresaDetalhesUpdateEvent>(_onUpdate);
  }

  Future<void> _onUpdate(EmpresaDetalhesUpdateEvent event, Emitter<EmpresaDetalhesState> emit) async {
    try {
      var resp = await service.update(event.user);
      emit(UpdateEmpresaSuccessState());
    } catch (error) {
      emit(UpdateEmpresaErrorState());
    }
  }
  
}