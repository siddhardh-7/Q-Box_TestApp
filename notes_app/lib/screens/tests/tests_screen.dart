import 'package:flutter/material.dart';

import './full_length_tests_screen.dart';
import './level_up_screen.dart';
import '../../widgets/custom_button_full.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);
  static const String routeName = '/tests-screen';

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
                    'Tests',
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
                height: 240,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButtonFull(
                  backColor: Colors.purple,
                  onTaphandler: () {
                    Navigator.of(context)
                        .pushNamed(LevelUptestsScreen.routeName);
                  },
                  text: 'Level up series',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButtonFull(
                  backColor: Colors.orange,
                  onTaphandler: () {
                    Navigator.of(context)
                        .pushNamed(FullLengthTestsScreen.routeName);
                  },
                  text: 'Full Length Tests',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
