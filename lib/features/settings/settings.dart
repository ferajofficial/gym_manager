import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SettingsView();
  }
}
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello GYM manager ..!!\n Settings Page")),
    );
  }
}