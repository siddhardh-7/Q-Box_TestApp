import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.keyboard_arrow_left_rounded),
                    ),
                    Text(
                      routeArgs['batchName'],
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 15.0,
                      child: Icon(Icons.person),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: teacherDetails.entries
                      .map(
                        (entry) => Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '${entry.key} : ${entry.value}',
                            style: HelperFunctions.textStyleCard(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButtonFull(
                  backColor: Colors.purple,
                  onTaphandler: () {
                    Navigator.of(context)
                        .pushNamed(LiveClassesScreen.routeName);
                  },
                  text: 'Live Classes',
                ),
                const SizedBox(
                  height: 20,
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
