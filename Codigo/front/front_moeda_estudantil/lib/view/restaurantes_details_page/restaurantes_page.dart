import 'package:flutter/material.dart';
import 'package:front_moeda_estudantil/generated/cambio_colors.dart';
import 'package:front_moeda_estudantil/view/restaurante_details_page/restaurante_details_page.dart';
import 'package:front_moeda_estudantil/view/restaurantes_details_page/widgets/image_carousel.dart';
import 'package:front_moeda_estudantil/view/shared/search_bar_widget.dart';
import 'package:front_moeda_estudantil/view/student_main_screen_page/student_main_screen_page.dart';
import 'package:heroicons/heroicons.dart';

class RestaurantesPage extends StatelessWidget {
  List<String> urls = [
    'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200',
    'https://www.truefoodkitchen.com/wp-content/uploads/2024/09/Whats-New_Fall-Menu_628x398.jpg',
    'https://images.theconversation.com/files/306217/original/file-20191210-95125-6w25t1.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=754&fit=clip',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CambioColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CambioColors.backgroundColor,
        title: Text(
          'Lanchonetes',
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
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
            color: CambioColors.greenSecondary,
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey[300],
          ),
          SearchBarWidget(controller: TextEditingController()),
          const SizedBox(
            height: 10,
          ),
          ImageCarousel(imageUrls: urls),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 440,
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                    left: 5,
                    top: 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CambioColors.backgroundColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Restaurante',
                                style: TextStyle(
                                  color: CambioColors.darkGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Uma descrição legal de um restaurante dahora.',
                                style: TextStyle(color: Colors.grey[400]),
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestauranteDetailsPage(),
                              ),
                            );
                          },
                          icon: const HeroIcon(
                            HeroIcons.chevronRight,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
