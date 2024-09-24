import 'package:flutter/material.dart';
import 'package:gym_manager/const/navigation_bar.dart';

class GymManager extends StatelessWidget {
  const GymManager({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavBar(),
    );
  }
}
