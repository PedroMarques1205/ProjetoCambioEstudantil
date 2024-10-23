import 'package:flutter/material.dart';
import '../professor_send_coins/professor_send_coins.dart';
import '../professor_extratc_page/professor_extratc_page.dart';
import '../perfil_professor_page/perfil_professor_page.dart';

class ProfessorMainScreenPage extends StatefulWidget {
  @override
  State<ProfessorMainScreenPage> createState() =>
      ProfessorMainScreenPageWidgetState();
}

class ProfessorMainScreenPageWidgetState extends State<ProfessorMainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Área do Professor'),
        backgroundColor: const Color(0xFF069E8C), 
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF99DB49),
              ),
              child: Text(
                'Opções',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessorProfilePage()), 
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Extrato'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessorExtractPage()), 
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('Enviar Moedas'),
              onTap: () {
                Navigator.pop(context); 
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ProfessorSendCoins(); 
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text(
              'Olá, Professor! Que bom ver você.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20), 
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Color(0xFF99DB49), 
                    size: 48, 
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '100', 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
