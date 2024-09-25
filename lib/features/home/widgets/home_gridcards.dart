import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeGridCards extends StatelessWidget {
  const HomeGridCards({
    super.key,
    required this.items,
  });

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
              20.widthBox,
              Expanded(
                child: Text(title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // color: Colors.amber,
                    )),
              ),
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
