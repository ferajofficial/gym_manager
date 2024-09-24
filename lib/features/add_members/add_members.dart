import 'package:flutter/material.dart';

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
  State<AddMembersView> createState() => _AddMembersViewState();
}

class _AddMembersViewState extends State<AddMembersView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello GYM manager ..!!\n Add members page")),
    );
  }
}
