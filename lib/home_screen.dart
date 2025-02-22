import 'package:flutter/material.dart';
import 'package:news_app/api_impl_widget.dart';
import 'package:news_app/categories_secssion.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/serves/api_manager.dart';

// development branch
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Screen',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff171717),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 166,
              color: const Color(0xffFFFFFF),
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
      body: selectedCategory ==null ? CategoriesSecssion(onTap: onCategoryClicked,)
      : ApiImplWidget(categoryname: selectedCategory!,),
    );
  }

    String? selectedCategory = null;

    onCategoryClicked(String category) {
       selectedCategory = category;
       setState(() {
         
       });
}
}