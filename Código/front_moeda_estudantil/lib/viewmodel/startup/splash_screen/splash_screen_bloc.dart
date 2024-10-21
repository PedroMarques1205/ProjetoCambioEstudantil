import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/startup/splash_screen/splash_screen_event.dart';
import 'package:front_moeda_estudantil/viewmodel/startup/splash_screen/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitState()) {
    on<SplashScreenLoadEvent>(_onLoad);
  }

  Future<void> _onLoad(SplashScreenLoadEvent event, Emitter<SplashScreenState> emit) async {
    emit(SplashScreenLoadedState());
  }
  
}