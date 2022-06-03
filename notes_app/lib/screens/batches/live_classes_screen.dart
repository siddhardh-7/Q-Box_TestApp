import 'package:flutter/material.dart';

import './live_video_play_screen.dart';

class LiveClassesScreen extends StatelessWidget {
  const LiveClassesScreen({Key? key}) : super(key: key);
  static const String routeName = '/live-classes-screen';

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
                children: [
                  const Text(
                    'Live Classes',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    // padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.cast_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    // padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    // padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.search),
                  ),
                  const CircleAvatar(
                    radius: 15.0,
                    child: Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(LiveVideoPlayScreen.routeName);
                      },
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 130,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 100,
                              child: Image.asset(
                                'assets/images/thumbnail.png',
                              ),
                            ),
                            const Align(
                              child:
                                  Text('Chapter name, Start time , End time'),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
