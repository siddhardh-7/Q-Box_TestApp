import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class TeacherProfileCard extends StatelessWidget {
  const TeacherProfileCard(
      {Key? key, required this.text, required this.onTaphandler})
      : super(key: key);

  final String text;
  final Function onTaphandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style:
                  const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          CustomButton(
            backColor: Colors.pink,
            onTaphandler: () {
              onTaphandler();
            },
            text: 'Follow',
          )
        ],
      ),
    );
  }
}
