import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Level Up Tests',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 15.0,
                    child: Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.only(
                      bottom: 15.0, left: 20.0, right: 20.0),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                                radius: 10.0),
                            enabled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onTap: () {},
                            trailing:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: IgnorePointer(
                  ignoring: true,
                  child: ExpansionTile(
                    childrenPadding: const EdgeInsets.only(
                        bottom: 15.0, left: 20.0, right: 20.0),
                    title: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                                  radius: 10.0),
                              enabled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
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
