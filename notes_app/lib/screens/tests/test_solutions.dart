import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class TestSolutionsScreen extends StatelessWidget {
  const TestSolutionsScreen({Key? key}) : super(key: key);
  static const String routeName = '/test-solutions-screen';

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
                    'Test name',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5 - 30,
                    child: CircleAvatar(
                      child: Icon(Icons.person, size: 60),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 1.5 - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total No of Questions : ',
                          style: HelperFunctions.textstyleSolution(),
                        ),
                        Text(
                          'No of Questions  Attempted : ',
                          style: HelperFunctions.textstyleSolution(),
                        ),
                        Text(
                          'No of Correct Answers : ',
                          style: HelperFunctions.textstyleSolution(),
                        ),
                        Text(
                          'Total marks : ',
                          style: HelperFunctions.textstyleSolution(),
                        ),
                        Text(
                          'Marks Obtained : ',
                          style: HelperFunctions.textstyleSolution(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '1. Here goes the question Here goes the question Here goes the question Here goes the question',
                      style: HelperFunctions.textStyleCard(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text('Option ${i + 1}',
                                style: HelperFunctions.textStyleCard()),
                            SizedBox(
                              width: 12,
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  i == 0 ? Colors.green : Colors.red,
                              radius: 10.0,
                            )
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your answer : B',
                      style: HelperFunctions.textStyleCard(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Explanation .... ',
                      style: HelperFunctions.textStyleCard(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
