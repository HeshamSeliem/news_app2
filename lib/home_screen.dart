import 'package:flutter/material.dart';
// development branch 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
      title:  Text('Home Screen',style: Theme.of(context).textTheme.titleMedium,),
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