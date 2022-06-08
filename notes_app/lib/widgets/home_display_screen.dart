import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

class HomeDisplayScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  const HomeDisplayScreen(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.height10 * 19,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
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
                title,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
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
