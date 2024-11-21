import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/student_main_screen_page.dart';
import 'package:front_moeda_estudantil/viewmodel/student_list_page/student_list_page_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/student_list_page/student_list_page_event.dart';
import 'package:front_moeda_estudantil/viewmodel/student_list_page/student_list_page_state.dart';
import 'package:heroicons/heroicons.dart';

class StudentListPageWidget extends StatefulWidget {
  @override
  State<StudentListPageWidget> createState() => StudentListPageWidgetState();
}

class StudentListPageWidgetState extends State<StudentListPageWidget> {
  late StudentListPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StudentListPageBloc();
    _bloc.add(ListStudentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentListPageBloc, StudentListPageState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StudentListPageLoadedState) {
          var students = state.students;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Estudantes',
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainStudentPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: CambioColors.greenPrimary,
                  )),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey[300]!, width: 0.5)),
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
                                    child:
                                        Icon(Icons.person, color: Colors.white),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                students[index].nome ?? '-',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                students[index].email ?? '-',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                _showModal(context);
                              },
                              icon: HeroIcon(
                                HeroIcons.chevronRight,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (state is ListStudentErrorState) {
          return const Center(
            child: Text('Erro'),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: CambioColors.greenPrimary,
          ),
        );
      },
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Opções',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Compartilhar'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.copy),
                title: Text('Copiar'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
