import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String subjectName = '';
  String difficulty = '';

  Future GetQuestions() async {
    final docData =
        FirebaseFirestore.instance.collection('tests').doc(subjectName);
    final snapshot = await docData.get();
    print('snapshot is ${snapshot}');
    if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      print('data is ${data}');
      return data['chapters']['chapterCount'] as String;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Dimensions.screenHeight - Dimensions.height10 * 16,
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
                  height: Dimensions.height10 * 2,
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
                      child: Text(
                          subjectName == '' ? 'Select Subject' : subjectName),
                    ),
                    children: [
                      Container(
                        height: Dimensions.height10 * 17,
                        child: SingleChildScrollView(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('tests')
                                .snapshots(), // path to collection of documents that is listened to as a stream
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  // Map<String, dynamic> data = document
                                  //     .data()! as Map<String, dynamic>;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        subjectName = document.id;
                                      });
                                    },
                                    child: ListTile(
                                      title: Text(
                                        document.id,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(), // casts to list for passing to children parameter
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10 * 2,
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
                      child: Text(
                          difficulty == '' ? 'Select difficulty' : difficulty),
                    ),
                    children: [
                      if (subjectName == '')
                        ListTile(
                            title: Text('Please select the Subject First!'))
                      else
                        Container(
                          height: Dimensions.height10 * 17,
                          child: SingleChildScrollView(
                            child: FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('tests')
                                  .doc(subjectName)
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return Text("Document does not exist");
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  print(data['chapters']);
                                  print(data['chapters']['chapter']);
                                  return data['chapters']['chapterCount'] == 0
                                      ? ListTile(
                                          title: Text('No chapters to prepare'),
                                        )
                                      : ListView(
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  difficulty = 'easy';
                                                });
                                              },
                                              child: ListTile(
                                                  title: Text(
                                                'easy',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  difficulty = 'medium';
                                                });
                                              },
                                              child: ListTile(
                                                  title: Text(
                                                'medium',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  difficulty = 'hard';
                                                });
                                              },
                                              child: ListTile(
                                                  title: Text(
                                                'hard',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                            ),
                                          ],
                                        );
                                }

                                return Text("loading");
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    backColor: const Color(0xff0CBC8B),
                    onTapHandler: () async {
                      // List<QuestionModel> questionsData = [];
                      // Navigator.of(context).pushNamed(Practice.routeName);
                      await GetQuestions();
                    },
                    text: 'Practice',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
