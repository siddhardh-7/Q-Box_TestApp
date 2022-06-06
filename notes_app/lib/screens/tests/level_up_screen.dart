import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:notes_app/widgets/appbar_actions.dart';

import '../../helpers/helpers.dart';
import '../../widgets/custom_button.dart';

class LevelUptestsScreen extends StatelessWidget {
  const LevelUptestsScreen({Key? key}) : super(key: key);
  static const String routeName = '/level-up-tests-screen';

  final Map<String, String> _chapter1 = const {
    'Level 1': 'easy',
    'Level 2': 'easy',
    'Level 3': 'medium',
  };
  final Map<String, String> _chapter2 = const {
    'Level 1': 'easy',
    'Level 2': 'medium',
    'Level 3': 'hard',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Level Up Tests',
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
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  CustomButton(
                    backColor: Colors.green,
                    onTaphandler: () {},
                    text: 'Select Subject',
                  ),
                  const Spacer(),
                  CustomButton(
                    backColor: Colors.green,
                    onTaphandler: () {},
                    text: 'Select Teacher',
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius12),
                ),
                color: Colors.white,
                elevation: 4.0,
                margin:
                    EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      bottom: Dimensions.height10 * 1.5,
                      left: Dimensions.width10 * 2,
                      right: Dimensions.width10 * 2),
                  title: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10 * 1.5),
                    child: Text('Chapter 1'),
                  ),
                  children: _chapter1.entries
                      .map((entry) => ListTile(
                            title: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            leading: CircleAvatar(
                                backgroundColor:
                                    HelperFunctions.getColortestsLevel(
                                        entry.value),
                                radius: Dimensions.borderRadius5 * 2),
                            enabled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius5 * 3),
                            ),
                            onTap: () {},
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius5 * 3),
                ),
                color: Colors.white,
                elevation: 4.0,
                margin:
                    EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5),
                child: IgnorePointer(
                  ignoring: true,
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.only(
                      bottom: Dimensions.height10 * 1.5,
                      left: Dimensions.width10 * 2,
                      right: Dimensions.width10 * 2,
                    ),
                    title: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10 * 1.5),
                      child: Text('Chapter 2  (Locked)'),
                    ),
                    children: _chapter2.entries
                        .map((entry) => ListTile(
                              title: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: CircleAvatar(
                                  backgroundColor:
                                      HelperFunctions.getColortestsLevel(
                                          entry.value),
                                  radius: Dimensions.borderRadius12),
                              enabled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.borderRadius5 * 3),
                              ),
                              onTap: () {},
                              trailing: const Icon(
                                  Icons.keyboard_arrow_right_rounded),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
