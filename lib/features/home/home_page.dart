import 'package:flutter/material.dart';
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
              title: "Bishu Bhai",
              subTitle: "BHAIJAN GYM - Manager",
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
                    size: 25,
                  ))).pOnly(right: 20),
        ],
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //       gradient:
        //           LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
        //     Colors.blueGrey,
        //     Colors.black,
        //     Colors.black,
        //   ])),
        // ),
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
            // child: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.bottomCenter,
            //       end: Alignment.topCenter,
            //       colors: [
            //         Colors.black.withOpacity(0.7),
            //         Colors.transparent,
            //       ],
            //     ),
            //   ),
            // ),
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
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Center(
                      child: Text(
                        'Card ${index + 1}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
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
