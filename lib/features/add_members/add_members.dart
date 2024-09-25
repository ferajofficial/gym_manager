import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart'; // For date formatting

class AddMembers extends StatelessWidget {
  const AddMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddMembersView();
  }
}

class AddMembersView extends StatefulWidget {
  const AddMembersView({super.key});

  @override
  State createState() => _AddMembersViewState();
}

class _AddMembersViewState extends State<AddMembersView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfJoiningController = TextEditingController();
  final TextEditingController _emergencyPhoneController = TextEditingController();
  final TextEditingController _lastPaymentDateController = TextEditingController();
  final TextEditingController _PaymentController = TextEditingController();

  String? _selectedMembershipTenure;
  DateTime? _lastPaymentDate;

  @override
  void initState() {
    super.initState();
    // Set today's date for the date of joining
    _dateOfJoiningController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  // Function to show alert after form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              'Member added successfully ✨💐',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          );
        },
      );
    }
  }

  // Function to pick the date for last payment date
  Future<void> _pickLastPaymentDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _lastPaymentDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && selectedDate != _lastPaymentDate) {
      setState(() {
        _lastPaymentDate = selectedDate;
        _lastPaymentDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Members',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image with blur effect
          Positioned.fill(
            child: Image.asset(
              'assets/illustrations/add_members_back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.black.withOpacity(0.5), // Blurry overlay
              ),
            ),
          ),
          // Form on top of the blurred background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Member Name Field with Prefix Icon
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Member Name',
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the member name';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),

                  // Member Age Field with Prefix Icon
                  TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Member Age',
                      prefixIcon: const Icon(Icons.cake, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the member age';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),

                  // Member Weight Field with Prefix Icon
                  TextFormField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Member Weight',
                      prefixIcon: const Icon(Icons.fitness_center, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the member weight';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),

                  // Phone Number Field with Prefix Icon
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      prefixText: "+91 ",
                      prefixStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the phone number';
                      }
                      if (value.length != 10) {
                        return 'Phone number must be 10 digits';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),
                  // Emergency Phone Number Field with Prefix Icon
                  TextFormField(
                    controller: _emergencyPhoneController,
                    decoration: InputDecoration(
                      prefixText: "+91 ",
                      prefixStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Emergency Phone Number (Optional)',
                      prefixIcon: const Icon(Icons.phone_android, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                  ).pOnly(bottom: 16),
                  // Membership Tenure Dropdown Field
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Membership Tenure',
                      prefixIcon: const Icon(Icons.timer, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    dropdownColor: Colors.grey[800],
                    value: _selectedMembershipTenure,
                    items: ['3 months', '6 months', '9 months', '12 months'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMembershipTenure = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a membership tenure';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),

                  // Date of Joining (Non-Editable)
                  TextFormField(
                    controller: _dateOfJoiningController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Date of Joining',
                      prefixIcon: const Icon(Icons.calendar_today, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    readOnly: true, // Make the field non-editable
                  ).pOnly(bottom: 16),
                  //Members Payment Amount
                  TextFormField(
                    controller: _PaymentController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Payment Amount',
                      prefixIcon: const Icon(Icons.currency_rupee_rounded, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null) {
                        return 'Please add amount';
                      }
                      return null;
                    },
                  ).pOnly(bottom: 16),
                  // Last Payment Date Picker with Prefix Icon
                  TextFormField(
                    controller: _lastPaymentDateController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber),
                      labelText: 'Last Payment Date',
                      prefixIcon: const Icon(Icons.payment, color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    readOnly: true, // Prevent manual input
                    onTap: _pickLastPaymentDate, // Trigger the date picker on tap
                  ).pOnly(bottom: 16),

                  // Submit Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      shadowColor: Colors.amber,
                    ),
                    child: Text(
                      'Add Member',
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ).h(50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
