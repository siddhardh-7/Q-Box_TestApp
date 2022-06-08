import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/profile.dart';
import 'package:notes_app/utilities/dimensions.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: Dimensions.padding20),
          child: const Icon(
            Icons.cast,
            color: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: Dimensions.padding20),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: Dimensions.padding20),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Profile.routeName);
            },
            child: AppBarProfileIcon()),
      ],
    );
  }
}

class AppBarProfileIcon extends StatelessWidget {
  Future<String> getUserImagePath() async {
    final user = await FirebaseAuth.instance.currentUser;
    String userEmail = user!.email.toString();
    print(userEmail);
    final userRef = await FirebaseStorage.instance.ref();
    String urlPath = 'users/${userEmail}/userProfile.jpeg';
    final userProfileUrl = await userRef.child(urlPath).getDownloadURL();
    print(userProfileUrl);

    return userProfileUrl;
  }

  const AppBarProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: Dimensions.padding20),
      child: CircleAvatar(
        radius: Dimensions.width10 * 1.6,
        backgroundImage: AssetImage('assets/images/user.jpg'),
      ),
    );
  }
}
