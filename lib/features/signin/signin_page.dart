import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SigninView();
  }
}

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image with blur effect
          Positioned.fill(
            child: Image.asset(
              'assets/illustrations/signin.png', // Ensure you have this asset
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  // color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Shield Your',
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Strength',
                              style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            // 6.widthBox,
                            // Icon(
                            //   Icons.fitness_center,
                            //   color: Colors.amber, // Icon in amber
                            //   size: MediaQuery.of(context).size.height * 0.1,
                            // ),
                          ],
                        ),
                        Text(
                          'Companion',
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.amber,
          elevation: 10,
          backgroundColor: Colors.amber, // Button in amber
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        ),
        child: Text(
          'Get Started',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
    );
  }
}
