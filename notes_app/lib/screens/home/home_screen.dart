import 'package:flutter/material.dart';

import '../../screens/home/practice_screen.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _curIdx = 0;

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
                    'Question Bank',
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
                height: 30.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                borderOnForeground: false,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.only(
                      bottom: 15.0, left: 20.0, right: 20.0),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('Select Subject'),
                  ),
                  children: [
                    ListTile(
                      leading: const Text(
                        'Subject 1',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      enabled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                    ListTile(
                      leading: const Text(
                        'Subject 2',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      enabled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                    ListTile(
                      leading: const Text(
                        'Subject 3',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      enabled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
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
                    child: Text('Select Chapter'),
                  ),
                  children: [
                    ListTile(
                      leading: const Text(
                        'Chapter 1',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      enabled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(Practice.routeName);
                      },
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomButton(
                    backColor: const Color(0xff0CBC8B),
                    onTaphandler: () {
                      Navigator.of(context).pushNamed(Practice.routeName);
                    },
                    text: 'Practice',
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
