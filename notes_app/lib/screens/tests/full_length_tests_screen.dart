import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import './completed_tests_screen.dart';
import './live_tests_screen.dart';

class FullLengthTestsScreen extends StatelessWidget {
  const FullLengthTestsScreen({Key? key}) : super(key: key);
  static const String routeName = '/full-length-screen';

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
                    'Full Length Tests',
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
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LiveTestsScreen.routeName);
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      'Live Tests',
                      style: HelperFunctions.textStyleCard(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(CompletedTestsScreen.routeName),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      'Completed Tests',
                      style: HelperFunctions.textStyleCard(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
