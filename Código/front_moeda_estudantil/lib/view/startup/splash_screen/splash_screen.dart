import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/login_page/login_page.dart';
import 'package:front_moeda_estudantil/viewmodel/startup/splash_screen/splash_screen_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/startup/splash_screen/splash_screen_event.dart';
import 'package:front_moeda_estudantil/viewmodel/startup/splash_screen/splash_screen_state.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenBloc bloc = SplashScreenBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SplashScreenLoadedState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is! SplashScreenLoadedState) {
          bloc.add(SplashScreenLoadEvent());
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              color: CambioColors.greenPrimary,
            ),
          ),
        );
      },
    );
  }
}
