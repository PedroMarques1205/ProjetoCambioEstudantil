import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:heroicons/heroicons.dart';

class MainStudentPage extends StatefulWidget {
  @override
  State<MainStudentPage> createState() => _MainStudentPageState();
}

class _MainStudentPageState extends State<MainStudentPage> {
  int _currentIndex = 0;
  bool _obscureText = true;
  double balance = 100.00;

  final List<Widget> _pages = [
    HomeScreen(),
    MarketScreen(),
    ConfigScreen(),
  ];

  void _toggleBalanceVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SmartCoin',
          style: TextStyle(
              color: CambioColors.greenPrimary, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              HeroIcon(
                HeroIcons.eyeSlash,
                color: Colors.grey[800],
              ),
              const SizedBox(width: 15),
              HeroIcon(
                HeroIcons.magnifyingGlass,
                color: Colors.grey[800],
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[600],
                child: Icon(
                  Icons.person,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(width: 15),
            ],
          )
        ],
        backgroundColor: Colors.white,
      ),
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
            icon: HeroIcon(HeroIcons.shoppingBag),
            label: 'Mercado',
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

// Widget da aba Home
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    double balance = 100.00;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo disponível',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      _obscureText
                          ? 'R\$ ••••••'
                          : 'R\$ ${balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {},
                      icon: HeroIcon(
                        _obscureText ? HeroIcons.eye : HeroIcons.eyeSlash,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Extrato de Transações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Cartões'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Investimentos'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Conteúdo do Mercado'));
  }
}

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Divider(
              color: Colors.grey[300],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    'Sair',
                    style: TextStyle(
                        color: CambioColors.darkPrimary, fontSize: 18),
                  ),
                  const Spacer(),
                  HeroIcon(
                    HeroIcons.arrowLeftEndOnRectangle,
                    color: CambioColors.greenSecondary,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
          ],
        ));
  }
}
