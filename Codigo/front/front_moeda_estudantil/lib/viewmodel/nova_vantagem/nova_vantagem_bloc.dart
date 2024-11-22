import 'package:flutter_bloc/flutter_bloc.dart';
import 'nova_vantagem_event.dart';
import 'nova_vantagem_state.dart';
import '../../domain/nova_vantegem/dto/nova_vantagem_dto.dart';
import '../../domain/nova_vantegem/nova_vantagem_service.dart';

class NovaVantagemBloc extends Bloc<NovaVantagemEvent, NovaVantagemState> {
  final NovaVantagemService service;

  NovaVantagemBloc({required this.service}) : super(NovaVantagemInitial());

  @override
  Stream<NovaVantagemState> mapEventToState(NovaVantagemEvent event) async* {
    if (event is SalvarNovaVantagemEvent) {
      yield NovaVantagemLoading();

      final vantagem = NovaVantagemDTO(
        titulo: event.titulo,
        descricao: event.descricao,
        valor: int.parse(event.valor),
        email: event.email,
      );

      final success = await service.salvarNovaVantagem(vantagem);

      if (success) {
        yield NovaVantagemSuccess();
      } else {
        yield NovaVantagemFailure("Falha ao salvar vantagem");
      }
    }
  }
}
