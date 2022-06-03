import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';

class Profile extends StatefulWidget {
  static String routeName = "profile";

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding20 / 2,
            vertical: Dimensions.padding20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.padding20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('notes_app/assets/images/user.jpg'),
                    radius: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UserName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${user?.email}",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text('Manage Your Google Account'))
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text('Analytics'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Coins'),
            ),
            ListTile(
              leading: Icon(
                Icons.color_lens_outlined,
              ),
              title: Text('Active Color'),
            ),
            ListTile(
              leading: Icon(
                Icons.follow_the_signs_rounded,
              ),
              title: Text('Followed Teachers'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(
                Icons.reviews,
              ),
              title: Text('Teacher Review'),
            ),
            ListTile(
              leading: Icon(
                Icons.note,
              ),
              title: Text('Blogs'),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Theme.of(context).primaryColor,
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
