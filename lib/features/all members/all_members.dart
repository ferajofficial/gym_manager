import 'package:flutter/material.dart';

class AllMembers extends StatelessWidget {
const AllMembers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AllMembersView();
  }
}
class AllMembersView extends StatefulWidget {
  const AllMembersView({super.key});

  @override
  State<AllMembersView> createState() => _AllMembersViewState();
}

class _AllMembersViewState extends State<AllMembersView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello GYM manager ..!!\n All members page")),
    );
  }
}