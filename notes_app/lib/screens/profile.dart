import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/get_user_details.dart';
import 'package:notes_app/helpers/auth_path.dart';
import 'package:notes_app/utilities/dimensions.dart';

class Profile extends StatefulWidget {
  static String routeName = "profile";

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  UserPerson fromJson(Map<String, dynamic> json) => UserPerson(
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
      );

  Future<UserPerson?> getDocId() async {
    final docUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.toString());
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return fromJson(snapshot.data()!);
    } else {
      return null;
    }
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.padding20 / 2,
              vertical: Dimensions.padding20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: Dimensions.padding20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "notes_app/assets/images/indian_flag.png"),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetUserName(user!.email.toString()),
                          // FutureBuilder<UserPerson?>(
                          //   future: getDocId(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasError) {
                          //       return Text(
                          //           'Something went wrong!.${snapshot.error}');
                          //     } else if (snapshot.hasData) {
                          //       final user = snapshot.data;
                          //       return user == null
                          //           ? Text('No User')
                          //           : Text(
                          //               user.firstName,
                          //               style: TextStyle(
                          //                 fontSize: 24,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             );
                          //     } else {
                          //       return Text(
                          //         'loading.....',
                          //         style: TextStyle(
                          //           fontSize: 24,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),

                          Text(
                            "${user?.email.toString()}",
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
                onPressed: () async {
                  await _signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AuthPath.routeName, (route) => false);
                },
                color: Theme.of(context).primaryColor,
                child: Text('Sign Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserPerson {
  String email;
  final String firstName;
  final String lastName;
  final int age;

  UserPerson(
      {this.email = '',
      required this.firstName,
      required this.lastName,
      required this.age});
  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
      };
}
