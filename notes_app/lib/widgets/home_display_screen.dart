import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

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
