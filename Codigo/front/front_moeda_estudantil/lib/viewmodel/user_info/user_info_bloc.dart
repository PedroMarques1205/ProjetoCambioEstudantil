import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/user/user_service.dart';
import 'package:front_moeda_estudantil/viewmodel/user_info/user_info_event.dart';
import 'package:front_moeda_estudantil/viewmodel/user_info/user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserService service = UserService();

  UserInfoBloc() : super(UserInfoInitState()) {
    on<UserInfoUpdateEvent>(_onUpdate);
  }

  Future<void> _onUpdate(UserInfoUpdateEvent event, Emitter<UserInfoState> emit) async {
    try {
      var resp = await service.update(event.user);
      emit(UserInfoUpdatedState());
    } catch (error) { 
      print(error);
      emit(UserInfoUpdateErrorState());
    }
  }
  
}