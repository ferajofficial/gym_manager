import 'package:flutter/material.dart';
import 'package:gym_manager/features/home/widgets/home_gridcards.dart';
import 'package:gym_manager/features/home/widgets/title_text.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> items = [
    {
      'icon': Icons.currency_rupee_rounded, // IconData type
      'title': 'Total Earnings',
    },
    {
      'icon': Icons.group, // String type (for SVG path)
      'title': 'Total Members',
    },
    {
      'icon': Icons.person_off_rounded,
      'title': 'Inactive Members',
    },
    {
      'icon': Icons.person_rounded,
      'title': 'Active Members',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            10.widthBox,
            const TitleText(
              title: "Jhon Doe",
              subTitle: "XYZ GYM - Manager",
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 25,
                  ))).pOnly(right: 20),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/illustrations/home_illustration.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                // color: Colors.amber,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    // Colors.amber,
                    Colors.amber,
                  ],
                ),
                // color: Colors.amber.withOpacity(0.5),
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              child: HomeGridCards(items: items).p12(),
            ),
          ),
        ],
      ),
    );
  }
}
