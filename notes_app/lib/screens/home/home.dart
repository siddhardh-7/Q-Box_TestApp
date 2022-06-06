import 'package:flutter/material.dart';
import 'package:notes_app/screens/batches/live_classes_screen.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:notes_app/widgets/category_style.dart';
import 'package:notes_app/widgets/home_display_screen.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List category = [
    'Select Course',
    'LIVE classes',
    'Free classes',
    'Did You Know?'
  ];

  List<String> categoryFunction = [
    '',
    LiveClassesScreen.routeName,
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Dimensions.height10 * 4,
            margin: EdgeInsets.only(top: Dimensions.height10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return CategoryStyle(
                  title: category[index].toString(),
                  OnTapRoute: categoryFunction[index],
                );
              },
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.all(Dimensions.padding20),
            itemCount: 7,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return HomeDisplayScreen();
            },
          ),
        ],
      ),
    ));
  }
}
