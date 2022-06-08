import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:notes_app/widgets/appbar_actions.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            routeArgs['batchName'],
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          AppBarProfileIcon(
            profileRadius: Dimensions.width10,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10 * 1.5,
                vertical: Dimensions.height10),
            child: Column(
              children: [
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
