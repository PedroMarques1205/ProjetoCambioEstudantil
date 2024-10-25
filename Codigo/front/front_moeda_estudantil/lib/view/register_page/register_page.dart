import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/empresa_page/empresa_page.dart';
import 'package:front_moeda_estudantil/view/main_screen_page/main_screen_page.dart';
import 'package:front_moeda_estudantil/viewmodel/register_page/register_page_bloc.dart';
import 'package:front_moeda_estudantil/viewmodel/register_page/register_page_event.dart';
import 'package:front_moeda_estudantil/viewmodel/register_page/register_page_state.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  String userType = 'Aluno';
  String email = '';
  String cpf = '';
  String cnpj = '';
  String rg = '';
  String endereco = '';
  String nome = '';
  String senha = '';

  final RegisterPageBloc _bloc = RegisterPageBloc();
  final backgroundUrl =
      'https://img.myloview.com.br/posters/seamless-geometric-isometric-polygon-pattern-3d-optical-illusion-abstract-pattern-vector-background-for-fabric-and-textile-printing-wrapping-paper-backdrops-web-banners-posts-700-239969750.jpg';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentIndex < (_getPageCount() - 1)) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  int _getPageCount() {
    return userType == 'Empresa' ? 2 : 3;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPageBloc, RegisterPageState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (Context.currentUser.type == 'ENTERPRISE') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EmpresaPage(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreenPage(),
              ),
            );
          }
        }
        if (state is RegisterErrorState) {
          const ScaffoldMessenger(
            child:
                Text('Erro o cadastrar usuário. Tente novamente mais tarde.'),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              if (_currentIndex == 0)
                ClipRRect(
                  child: Image.network(
                    backgroundUrl,
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    _buildUserTypeSelection(),
                    _buildPersonalDataForm(),
                    if (userType != 'Empresa') _buildInstitutionForm(),
                  ],
                ),
              ),
              _buildPageIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentIndex > 0)
                      CircleAvatar(
                        backgroundColor: CambioColors.darkGray,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left,
                              color: Colors.white),
                          onPressed: _goToPreviousPage,
                        ),
                      ),
                    if (_currentIndex < _getPageCount() - 1)
                      CircleAvatar(
                        backgroundColor: CambioColors.darkGray,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_right,
                              color: Colors.white),
                          onPressed: _goToNextPage,
                        ),
                      )
                    else
                      CircleAvatar(
                        backgroundColor: CambioColors.greenSecondary,
                        child: IconButton(
                          icon: const Icon(Icons.check, color: Colors.white),
                          onPressed: () {
                            _bloc.add(RegisterUserEvent(
                                email: email,
                                cpf: cpf,
                                cnpj: cnpj,
                                rg: rg,
                                endereco: endereco,
                                nome: nome,
                                senha: senha,
                                type: _getUserType(),
                                ativo: true));
                          },
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getUserType() {
    if (userType == 'Aluno') {
      return UserTypeEnum.student.name;
    } else if (userType == 'Professor') {
      return UserTypeEnum.teacher.name;
    } else {
      return UserTypeEnum.enterprise.name;
    }
  }

  Widget _buildUserTypeSelection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 35, right: 35, top: 30, bottom: 15),
          child: Text('Qual é seu perfil?',
              style: TextStyle(
                  fontSize: 45,
                  color: CambioColors.darkGray,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUserTypeButton('Aluno'),
            const SizedBox(width: 10),
            _buildUserTypeButton('Professor'),
            const SizedBox(width: 10),
            _buildUserTypeButton('Empresa'),
          ],
        ),
      ],
    );
  }

  Widget _buildUserTypeButton(String type) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            userType == type ? const Color(0xFF99DB49) : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          userType = type;
        });
      },
      child: Text(type),
    );
  }

  Widget _buildPersonalDataForm() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cadastro de $userType',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: CambioColors.darkGray)),
          const SizedBox(height: 20),
          _buildTextField('Nome', (valueName) {
            nome = valueName;
          }),
          _buildTextField('Email', (valueEmail) {
            email = valueEmail;
          }),
          if (userType != 'Empresa')
            _buildTextField('CPF', (valueCPF) {
              cpf = valueCPF;
            }),
          if (userType != 'Empresa')
            _buildTextField('RG', (valueRG) {
              rg = valueRG;
            }),
          if (userType != 'Empresa')
            _buildTextField('Endereço', (valueAdress) {
              endereco = valueAdress;
            }),
          if (userType == 'Empresa')
            _buildTextField('CNPJ', (valueCNPJ) {
              cnpj = valueCNPJ;
            }),
          _buildTextField('Senha', (senhaValue) {
            senha = senhaValue;
          }),
        ],
      ),
    );
  }

  Widget _buildInstitutionForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dados Institucionais',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: CambioColors.darkGray)),
          const SizedBox(height: 20),
          _buildTextField('Instituição de Ensino', (value) {}),
          _buildTextField('Curso', (value) {}),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, void Function(String value) onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        onChanged: (value) {
          onChange(value);
        },
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    int pageCount = _getPageCount();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentIndex == index ? const Color(0xFF99DB49) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
