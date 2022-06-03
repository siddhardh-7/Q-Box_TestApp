import 'package:flutter/material.dart';

import './test_start_screen.dart';

import '../../helpers/helpers.dart';
import '../../widgets/custom_button.dart';

class LiveTestsScreen extends StatelessWidget {
  LiveTestsScreen({Key? key}) : super(key: key);
  static const String routeName = '/live-tests-screen';

  final PageController _pageController = PageController();

  Column page1() {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              'Test Name',
              style: HelperFunctions.textStyleCard(),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            backColor: Colors.grey,
            onTaphandler: () {
              _pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            text: 'Take Test',
          ),
        )
      ],
    );
  }

  Column page2(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              'Test Guidelines',
              style: HelperFunctions.textStyleCard(),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            backColor: Colors.grey,
            onTaphandler: () {
              Navigator.of(context).pushNamed(TestStartScreen.routeName);
            },
            text: 'Start Test',
          ),
        )
      ],
    );
  }

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
                    'Live Tests',
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
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 130,
                child: PageView(
                  controller: _pageController,
                  children: [
                    page1(),
                    page2(context),
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


/*
Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Test Name',
                            style: HelperFunctions.textStyleCard(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          backColor: Colors.grey,
                          onTaphandler: () {},
                          text: 'Take test',
                        ),
                      )








*/
