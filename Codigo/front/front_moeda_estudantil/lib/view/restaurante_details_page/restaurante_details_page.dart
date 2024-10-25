import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/restaurante_details_page/widgets/discount_ticket.dart';
import 'package:front_moeda_estudantil/view/restaurantes_details_page/restaurantes_page.dart';
import 'package:heroicons/heroicons.dart';

class RestauranteDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CambioColors.backgroundColor,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://media.istockphoto.com/id/1309966291/pt/foto/delivery-fast-food-concept.jpg?s=612x612&w=0&k=20&c=rdNasw6NSbmc5FeKJoZUJDSNJRNqJ_OiwDbexz7zt_Y=',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantesPage(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: HeroIcon(
                              HeroIcons.chevronLeft,
                              color: Colors.grey[800],
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 100,
              left: 5,
              right: 5,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey[400]!,
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Lanchonete',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  'Descrição da lanchonete está aqui!',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 28,
                          ))
                    ],
                  ))),
        ],
      ),
    );
  }
}
