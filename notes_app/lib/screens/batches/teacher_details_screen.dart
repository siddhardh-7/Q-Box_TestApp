import 'package:flutter/material.dart';
import 'package:notes_app/models/teacherModel.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:notes_app/widgets/appbar_actions.dart';

import './live_classes_screen.dart';

import '../../helpers/helpers.dart';
import '../../widgets/custom_button_full.dart';

class TeacherDetailsScreen extends StatelessWidget {
  const TeacherDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/teacher-details-screen';

  final Map<String, String> teacherDetails = const {
    'TeacherName': 'Name',
    'Subject Name': 'Mathematics',
    'Start Date': ' 22 April 2022',
    'End Date': ' 25 April 2022',
  };

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    TeacherModel teacher = routeArgs['teacher'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            routeArgs['batchName'],
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: Dimensions.width10),
            child: AppBarProfileIcon(
              profileRadius: Dimensions.width10 * 2,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width10 * 1.5,
              right: Dimensions.width10 * 1.5,
              top: Dimensions.height10 * 3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Teacher Name : ${teacher.name.toString().toUpperCase()}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Subject Name : ${teacher.subjectName.toString().toUpperCase()}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Start Date : " " ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'End Date : " " ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Dimensions.height10 * 6,
                ),
                CustomButtonFull(
                  backColor: Colors.purple,
                  onTaphandler: () {
                    Navigator.of(context)
                        .pushNamed(LiveClassesScreen.routeName);
                  },
                  text: 'Live Classes',
                ),
                SizedBox(
                  height: Dimensions.height10 * 2,
                ),
                CustomButtonFull(
                  backColor: Colors.orange,
                  onTaphandler: () {},
                  text: 'Completed Classes',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
