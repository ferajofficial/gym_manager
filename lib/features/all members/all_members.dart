import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AllMembers extends StatelessWidget {
  const AllMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return const AllMembersView();
  }
}

class AllMembersView extends StatefulWidget {
  const AllMembersView({super.key});

  @override
  State<AllMembersView> createState() => _AllMembersViewState();
}

class _AllMembersViewState extends State<AllMembersView> {
  final List<Map<String, dynamic>> members = List.generate(
    10,
    (index) => {
      'name': 'Jhon Doe',
      'contact': '1234567890',
      'joiningDate': '2022-01-01',
      'planName': '${(index % 12) + 1} months',
      'lastPaymentDate': '2023-09-15',
      'paymentAmount': '\$100',
      'isActive': index % 2 == 0, // Active for even indexed members
    },
  );
  final List<bool> _isExpanded = List.generate(15, (_) => false); // Track expansion state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'All Members',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image with blur effect
          Positioned.fill(
            child: Image.asset(
              'assets/illustrations/all_members_back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.5), // Blurry overlay
              ),
            ),
          ),
          // ListView with ExpansionTiles
          Positioned.fill(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return Card(
                  color: Colors.grey[800],
                  child: ExpansionTile(
                    shape: const Border(bottom: BorderSide.none),
                    leading: _buildStatusBadge(member['isActive']),
                    trailing: Icon(
                      _isExpanded[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    title: Text(
                      member['name'],
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    children: [
                      _buildMemberDetailRow('Contact Number', member['contact']),
                      10.heightBox,
                      _buildMemberDetailRow('Joining Date', member['joiningDate']),
                      10.heightBox,
                      _buildMemberDetailRow('Plan', member['planName']),
                      10.heightBox,
                      _buildMemberDetailRow('Last Payment Date', member['lastPaymentDate']),
                      10.heightBox,
                      _buildMemberDetailRow('Payment Amount', member['paymentAmount']),
                      10.heightBox,
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: _buildStatusBadge(member['isActive']),
                      // )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _isExpanded[index] = expanded;
                      });
                    },
                  ),
                ).pOnly(bottom: 6);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build status badge
  Widget _buildStatusBadge(bool isActive) {
    return CircleAvatar(
        backgroundColor: isActive ? Colors.green : Colors.red,
        child: Icon(
          isActive ? Icons.check : Icons.close_rounded,
          size: 26,
          color: Colors.white,
        ));
  }

  // Widget to build each detail row for the member
  Widget _buildMemberDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
