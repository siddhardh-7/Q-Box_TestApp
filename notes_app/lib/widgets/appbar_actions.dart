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
        Container(
          margin: EdgeInsets.only(right: Dimensions.width10),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Profile.routeName);
              },
              child: AppBarProfileIcon(
                profileRadius: Dimensions.width10 * 2,
              )),
        ),
      ],
    );
  }
}

class AppBarProfileIcon extends StatefulWidget {
  final profileRadius;
  AppBarProfileIcon({Key? key, required this.profileRadius}) : super(key: key);

  @override
  State<AppBarProfileIcon> createState() => _AppBarProfileIconState();
}

class _AppBarProfileIconState extends State<AppBarProfileIcon> {
  Future<String> getUserImagePath() async {
    final user = await FirebaseAuth.instance.currentUser;
    String userEmail = user!.email.toString();
    print(userEmail);
    final userRef = await FirebaseStorage.instance.ref();
    String urlPath = 'users/${userEmail}/UserProfile.jpeg';
    final userProfileUrl = await userRef.child(urlPath).getDownloadURL();
    print(userProfileUrl);

    return userProfileUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.profileRadius * 2,
      height: widget.profileRadius * 2,
      // margin: EdgeInsets.only(right: Dimensions.padding20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadius5 * 20),
      ),
      child: FutureBuilder(
          future: getUserImagePath(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return CircleAvatar(
                backgroundImage: NetworkImage(
                  snapshot.data!,
                ),
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return Icon(
              Icons.person,
              size: (24 / 40) * widget.profileRadius * 2,
            );
          }),
    );
  }
}
