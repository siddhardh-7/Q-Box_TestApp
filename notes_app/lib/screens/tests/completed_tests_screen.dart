import 'package:flutter/material.dart';

import './test_solutions.dart';

class CompletedTestsScreen extends StatelessWidget {
  const CompletedTestsScreen({Key? key}) : super(key: key);
  static const String routeName = '/completed-tests-screen';

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
                    'Completed Tests',
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  tileColor: Colors.yellow,
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  title: const Text('Test Name 1'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TestSolutionsScreen.routeName);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  tileColor: Colors.yellow,
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  title: const Text('Test Name 2'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TestSolutionsScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
