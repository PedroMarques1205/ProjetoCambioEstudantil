import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
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
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  'https://avatar.iran.liara.run/public/${Context.number}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      child: Icon(Icons.person, color: Colors.white),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
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
                onPressed: () => _showEditDialog(context, user),
                icon: HeroIcon(
                  HeroIcons.pencilSquare,
                  color: CambioColors.greenSecondary,
                ))
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, UserDTO user) {
    TextEditingController nameController =
        TextEditingController(text: user.nome);
    TextEditingController emailController =
        TextEditingController(text: user.email);
    TextEditingController enderecoController =
        TextEditingController(text: user.endereco);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                'Meu Perfil',
                style: TextStyle(
                    color: CambioColors.greenSecondary,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const HeroIcon(
                    HeroIcons.trash,
                    color: Colors.red,
                  ))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: enderecoController,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Salvar',
                style: TextStyle(
                    color: CambioColors.greenSecondary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
