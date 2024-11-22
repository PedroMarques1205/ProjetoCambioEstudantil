import 'package:flutter_bloc/flutter_bloc.dart';
import 'empresa_event.dart';
import 'empresa_state.dart';
import '../../domain/vantagem/vantagem_service.dart';  
import '../../domain/vantagem/dtos/vantagem_dto.dart';

class EmpresaBloc extends Bloc<EmpresaEvent, EmpresaState> {
  final VantagemService vantagemService;

  EmpresaBloc(this.vantagemService) : super(EmpresaInitial()){
    on<FetchVantagensEvent>(_mapFetchVantagensEventToState);
  }

  // @override
  // Stream<EmpresaState> mapEventToState(EmpresaEvent event) async* {
  //   if (event is FetchVantagensEvent) {
  //     yield* _mapFetchVantagensEventToState(event);
  //   }
  // }

  // Lógica para lidar com o evento FetchVantagensEvent
  Future<void> _mapFetchVantagensEventToState(FetchVantagensEvent event,Emitter<EmpresaState> emite) async {
    emite(VantagensLoading()); 
    try {
      // Chamando o serviço para buscar as vantagens com o CNPJ fornecido
      final vantagens = await vantagemService.obterVantagensPorEmpresa(event.cnpj);
      emite(VantagensLoaded(vantagens)); 
    } catch (e) {
      emite(VantagensLoading()); 
    }
  }
}
