import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/mensalidade_page/mensalidade_page.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/widgets/user_coins_widget.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/widgets/user_info_widget.dart';
import 'package:heroicons/heroicons.dart';

class MainStudentPage extends StatefulWidget {
  @override
  State<MainStudentPage> createState() => _MainStudentPageState();
}

class _MainStudentPageState extends State<MainStudentPage> {
  int _currentIndex = 0;
  bool _obscureText = true;
  double balance = 100.00;

  final List<Widget> _pages = [];

  void _toggleBalanceVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomeScreen(
        balance: balance,
        obscureText: _obscureText,
        onToggleVisibility: _toggleBalanceVisibility,
      ),
      Container(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CambioColors.backgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.cog6Tooth),
            label: 'Config',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final double balance;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const HomeScreen({
    Key? key,
    required this.balance,
    required this.obscureText,
    required this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 23, left: 23),
        child: Column(
          children: [
            UserInfoWidget(
              user: Context.currentUser,
            ),
            UserCoinsWidget(
              user: Context.currentUser,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MensalidadePage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            HeroIcon(
                              HeroIcons.currencyDollar,
                              color: CambioColors.greenSecondary,
                            ),
                            Text(
                              'Financeiro',
                              style:
                                  TextStyle(color: CambioColors.greenSecondary),
                            )
                          ],
                        ),
                      )),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        HeroIcon(
                          HeroIcons.homeModern,
                          color: CambioColors.greenSecondary,
                        ),
                        Text(
                          'Restaurantes',
                          style: TextStyle(color: CambioColors.greenSecondary),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        HeroIcon(
                          HeroIcons.bookOpen,
                          color: CambioColors.greenSecondary,
                        ),
                        Text(
                          'Materiais',
                          style: TextStyle(color: CambioColors.greenSecondary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Atividades',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: HeroIcon(
                            HeroIcons.adjustmentsHorizontal,
                            color: CambioColors.greenPrimary,
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
