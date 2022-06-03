import 'package:flutter/material.dart';

import './teacher_details_screen.dart';
import './teacher_profile_card.dart';

class BatcheDetailsScreen extends StatelessWidget {
  const BatcheDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/batches-details-screen';

  final List<String> _teacherNames = const [
    'Teacher 1',
    'Teacher 2',
    'Teacher 3'
  ];

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
                for (int i = 0; i < _teacherNames.length; i++)
                  TeacherProfileCard(
                      text: _teacherNames[i],
                      onTaphandler: () {
                        Navigator.of(context).pushNamed(
                            TeacherDetailsScreen.routeName,
                            arguments: {
                              'batchName': routeArgs['batchName'],
                            });
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
