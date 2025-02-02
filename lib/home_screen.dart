import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
      title: const Text('Home Screen'),
      centerTitle: true,
    ),
       body: Column(
        children: [
          Image.asset("assets/images/splash_branding.png")
        ],
       ),
    );
  }
}