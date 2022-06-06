import 'package:flutter/material.dart';
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
          AppBarProfileIcon(),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: teacherDetails.entries
                      .map(
                        (entry) => Padding(
                          padding: EdgeInsets.all(Dimensions.padding20 / 3.33),
                          child: Text(
                            '${entry.key} : ${entry.value}',
                            style: HelperFunctions.textStyleCard(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                      .toList(),
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
