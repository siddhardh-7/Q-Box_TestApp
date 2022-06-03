import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

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
                return CategoryStyle(title: category[index].toString());
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

class CategoryStyle extends StatelessWidget {
  final String title;
  CategoryStyle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width10 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderRadius12 * 2),
        color: Theme.of(context).primaryColor,
      ),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class HomeDisplayScreen extends StatelessWidget {
  const HomeDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.height10 * 19,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.redAccent[200],
          ),
          child: const Text(
            'Create a Design System',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/figma.png'),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Dimensions.width10 * 30,
              child: Text(
                'Build with Figma : Create a design sytem -- Foundations',
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Figma '),
            Text('44K Likes'),
            Text('4 minutes ago'),
            SizedBox(),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
