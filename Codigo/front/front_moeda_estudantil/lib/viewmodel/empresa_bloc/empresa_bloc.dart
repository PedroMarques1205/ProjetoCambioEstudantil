import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/nova_vantegem/client/nova_vantagem_client.dart';
import 'package:front_moeda_estudantil/domain/nova_vantegem/dto/nova_vantagem_dto.dart';
import 'package:front_moeda_estudantil/domain/nova_vantegem/nova_vantagem_service.dart';
import 'package:front_moeda_estudantil/domain/vantagem/dtos/vantagem_dto.dart';
import 'empresa_event.dart';
import 'empresa_state.dart';
import '../../domain/vantagem/vantagem_service.dart';

class EmpresaBloc extends Bloc<EmpresaEvent, EmpresaState> {
  final VantagemService vantagemService;

  final NovaVantagemService service = NovaVantagemService(NovaVantagemClient,
      client: NovaVantagemClient(baseUrl: Context.baseUrl));

  EmpresaBloc(this.vantagemService) : super(EmpresaInitial()) {
    on<FetchVantagensEvent>(_mapFetchVantagensEventToState);
    on<SalvarNovaVantagemEvent>(mapEventToState);
  }

  @override
  Future<void> mapEventToState(
      SalvarNovaVantagemEvent event, Emitter<EmpresaState> emit) async {
    final vantagem = NovaVantagemDTO(
      titulo: event.titulo,
      descricao: event.descricao,
      valor: 10.0,
      email: Context.currentUser.email!,
    );

    try {
      final success = await service.salvarNovaVantagem(vantagem);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _mapFetchVantagensEventToState(
      FetchVantagensEvent event, Emitter<EmpresaState> emite) async {
    emite(VantagensLoading());
    try {
      final vantagensJson =
          await vantagemService.obterVantagensPorEmpresa(event.cnpj);

      final vantagens = (vantagensJson as List)
          .map((item) => VantagemDTO.fromJson(item as Map<String, dynamic>))
          .toList();

      emite(VantagensLoaded(vantagens));
    } catch (e) {
      emite(VantagensError("Erro ao carregar vantagens: $e"));
    }
  }
}
