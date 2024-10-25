import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

abstract class UserInfoEvent {}

class UserInfoUpdateEvent extends UserInfoEvent {
  final UserDTO user;

  UserInfoUpdateEvent({required this.user});
}