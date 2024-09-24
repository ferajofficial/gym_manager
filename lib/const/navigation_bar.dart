import 'package:flutter/material.dart';
import 'package:gym_manager/features/add_members/add_members.dart';
import 'package:gym_manager/features/all%20members/all_members.dart';
import 'package:gym_manager/features/home/home_page.dart';
import 'package:gym_manager/features/settings/settings.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavBar();
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  // List of screens to display for each tab
  final List<Widget> _screens = [
    const HomePage(),
    const AddMembers(),
    const AllMembers(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Update the selected index when a tab is tapped
        backgroundColor: Colors.black, // Set the background color
        selectedItemColor: Colors.amber, // Set the color for the selected item
        unselectedItemColor: Colors.grey.shade800, // Set the color for the unselected items
        type: BottomNavigationBarType.fixed, // Make sure the style applies correctly on iOS
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Add Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'All Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/**
 
 import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:velocity_x/velocity_x.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    * to use this custom navigation bar in any page, wrap the page scaffold with a stack widget
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  // context.router.push(const SigninRoute());
                },
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.navigateTo(const ProfileRoute());
                  // setState(() {
                  //   _selectedIndex = 1;
                  //   context.navigateTo(const ProfileRoute());
                  //   // _selectedIndex = 0;
                  // });
                },
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
        )
            .h(55)
            .w(280)
            .pOnly(bottom: 15, left: 20, right: 20)
            .objectBottomCenter(),
        FloatingActionButton(
          // elevation: 5,
          onPressed: widget.onPressed,
          shape: const CircleBorder(),
          backgroundColor: Colors.grey[900],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ).h(55).w(55),
        ).objectBottomCenter().pOnly(bottom: 40),
      ],
    );
  }
}
 */