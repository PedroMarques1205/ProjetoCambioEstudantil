import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:heroicons/heroicons.dart';

class UserInfoWidget extends StatelessWidget {
  final UserDTO user;

  const UserInfoWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: CambioColors.greenSecondary,
              radius: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.email ?? user.cnpj ?? user.cpf ?? '',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  user.nome ?? '-',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: HeroIcon(
                  HeroIcons.pencilSquare,
                  color: CambioColors.greenSecondary,
                ))
          ],
        ),
      ),
    );
  }
}
