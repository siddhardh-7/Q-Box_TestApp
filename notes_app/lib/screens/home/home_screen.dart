import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

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
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width15,
              vertical: Dimensions.height10 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question Bank',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.height10 * 3,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius15),
                ),
                color: Colors.white,
                elevation: 4.0,
                borderOnForeground: false,
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      bottom: Dimensions.height10 * 1.5,
                      left: Dimensions.width10 * 2,
                      right: Dimensions.width10 * 2),
                  title: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width15),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 3,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius15),
                ),
                color: Colors.white,
                elevation: 4.0,
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      bottom: Dimensions.height10 * 1.5,
                      left: Dimensions.width10 * 2,
                      right: Dimensions.width10 * 2),
                  title: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width15),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
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
                  padding: EdgeInsets.only(bottom: Dimensions.height10),
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
