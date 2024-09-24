import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return HomeCards(
                    title: items[index]['title']!,
                    icon: items[index]['icon']!,
                  );
                },
              ).p12(),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  final String title;
  final IconData icon;
  const HomeCards({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.withOpacity(0.6),
      // color: Colors.amber,
      // color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(4, 0),
                        blurRadius: 10,
                      ),
                    ],
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                    shape: BoxShape.circle),
                child: Icon(icon),
              ).h(45).w(45),
              Text(title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    // color: Colors.amber,
                  )),
            ],
          ),
          Text('00',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // color: Colors.amber,
              )),
        ],
      ).p12(),
    );
  }
}
