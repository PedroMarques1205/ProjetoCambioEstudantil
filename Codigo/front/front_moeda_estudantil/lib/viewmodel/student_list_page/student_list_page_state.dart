import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

abstract class StudentListPageState {}

class StudentListPageInitState extends StudentListPageState {}

class StudentListPageLoadedState extends StudentListPageState {
  final List<UserDTO> students;

  StudentListPageLoadedState({required this.students});
}

class ListStudentErrorState extends StudentListPageState {}