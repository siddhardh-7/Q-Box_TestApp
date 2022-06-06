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
        AppBarProfileIcon(),
      ],
    );
  }
}

class AppBarProfileIcon extends StatelessWidget {
  const AppBarProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Profile.routeName);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: Dimensions.padding20),
        child: CircleAvatar(
          radius: Dimensions.width10 * 1.6,
          backgroundImage: AssetImage('assets/images/user.jpg'),
        ),
      ),
    );
  }
}
