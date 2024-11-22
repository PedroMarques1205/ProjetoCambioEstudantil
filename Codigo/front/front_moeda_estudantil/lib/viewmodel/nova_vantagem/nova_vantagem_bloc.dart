import 'package:flutter_bloc/flutter_bloc.dart';
import 'nova_vantagem_event.dart';
import 'nova_vantagem_state.dart';
import '../../domain/nova_vantegem/dto/nova_vantagem_dto.dart';
import '../../domain/nova_vantegem/nova_vantagem_service.dart';

class NovaVantagemBloc extends Bloc<NovaVantagemEvent, NovaVantagemState> {
  final NovaVantagemService service;

  NovaVantagemBloc({required this.service}) : super(NovaVantagemInitial()) {}
}
