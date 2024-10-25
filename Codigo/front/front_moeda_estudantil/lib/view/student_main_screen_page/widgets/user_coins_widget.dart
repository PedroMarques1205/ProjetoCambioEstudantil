import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:heroicons/heroicons.dart';

class UserCoinsWidget extends StatefulWidget {
  final UserDTO user;

  const UserCoinsWidget({super.key, required this.user});

  @override
  _UserCoinsWidgetState createState() => _UserCoinsWidgetState();
}

class _UserCoinsWidgetState extends State<UserCoinsWidget> {
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CambioColors.darkGray,
            CambioColors.greenPrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  'Saldo disponível',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _toggleVisibility,
                  icon: HeroIcon(
                    _isObscured ? HeroIcons.eyeSlash : HeroIcons.eye,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              _isObscured ? '***' : 'R\$${widget.user.saldoMoedas.toString()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
