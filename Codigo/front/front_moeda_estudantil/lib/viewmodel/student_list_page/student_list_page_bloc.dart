import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/domain/user/user_service.dart';
import 'package:front_moeda_estudantil/viewmodel/student_list_page/student_list_page_event.dart';
import 'package:front_moeda_estudantil/viewmodel/student_list_page/student_list_page_state.dart';

class StudentListPageBloc
    extends Bloc<StudentListPageEvent, StudentListPageState> {
  final UserService service = UserService();

  StudentListPageBloc() : super(StudentListPageInitState()) {
    on<ListStudentsEvent>(_onList);
  }

  Future<void> _onList(
      ListStudentsEvent event, Emitter<StudentListPageState> emit) async {
    try {
      List<UserDTO> students = await service.getStudents();
      emit(StudentListPageLoadedState(students: students));
    } catch (error) {
      emit(ListStudentErrorState());
    }
  }
}
