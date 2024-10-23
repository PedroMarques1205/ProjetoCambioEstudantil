import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/professor_send_coins/professor_send_coins_service.dart'; // Certifique-se de que o caminho está correto
import '../../domain/professor_send_coins/dtos/professor_send_coins_dto.dart';
import '../../viewmodel/professor_send_coins/ProfessorSendCoinsEvent.dart';
import '../../viewmodel/professor_send_coins/ProfessorSendCoinsState.dart';

class ProfessorSendCoinsBloc extends Bloc<ProfessorSendCoinsEvent, ProfessorSendCoinsState> {
  final CoinsService coinsService;

  ProfessorSendCoinsBloc({required this.coinsService}) : super(ProfessorSendCoinsInitial()) {
    on<SendCoinsButtonPressed>(_onSendCoinsButtonPressed); // Atualizado para o padrão mais recente do Bloc
  }

  void _onSendCoinsButtonPressed(
    SendCoinsButtonPressed event,
    Emitter<ProfessorSendCoinsState> emit,
  ) async {
    emit(ProfessorSendCoinsLoading());

    try {
      // Construa o DTO para enviar
      final sendCoinsDTO = SendCoinsDTO(
        matricula: event.matricula,
        quantidade: int.parse(event.quantidade),
        motivo: event.motivo,
      );

      // Envie as moedas através do serviço
      await coinsService.sendCoins(sendCoinsDTO);

      emit(ProfessorSendCoinsSuccess());
    } catch (error) {
      emit(ProfessorSendCoinsFailure(error: error.toString()));
    }
  }
}
