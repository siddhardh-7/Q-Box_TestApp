import 'package:animate_do/animate_do.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../helpers/helpers.dart';
import '../../provider/data_provider.dart';
import '../../widgets/custom_button.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  static const routeName = '/practice-screen';

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  int questionNumber = 0;
  bool isOptionChosen = false;
  bool isVideoSolenabled = false;
  bool isSliderOpen = false;
  final List<int> _allSelectedChoices = List.filled(20, 0);

  // VideoPlayerController? _controller;
  FlickManager? flickManager;

  @override
  void dispose() {
    super.dispose();
    flickManager?.dispose();
    // _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Questions> questions =
        Provider.of<Data>(context).practiceQuestions;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Chapter Name',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15,
                  vertical: Dimensions.height10 * 1.5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInUp(
                      from: 50,
                      duration: const Duration(milliseconds: 375),
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.padding20 / 2),
                          child: Text(
                            '${questionNumber + 1}.  ${questions[questionNumber].question}',
                            style: HelperFunctions.textstyle(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    for (int i = 0; i < 4; i++)
                      FadeInUp(
                        from: 50,
                        duration: const Duration(milliseconds: 375),
                        delay: Duration(milliseconds: 100 + 100 * i),
                        child: InkWell(
                          onTap: () {
                            if (_allSelectedChoices[questionNumber] == 0) {
                              setState(() {
                                isOptionChosen = true;
                              });
                              //if correct
                              if (i ==
                                  questions[questionNumber].correctOption - 1) {
                                setState(() {
                                  _allSelectedChoices[questionNumber] = 1;
                                });
                                showCustomSnackbar(
                                  text: 'Correct',
                                  icon: Icons.done,
                                  context: context,
                                );
                              } //if wrong
                              else {
                                setState(() {
                                  _allSelectedChoices[questionNumber] = -1;
                                });
                                showCustomSnackbar(
                                  text: 'Wrong',
                                  icon: Icons.close,
                                  context: context,
                                );
                              }
                            }
                          },
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius5),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 375),
                            padding: const EdgeInsets.all(10.0),
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                vertical: Dimensions.width10 / 2),
                            child: Text(
                              questions[questionNumber].options[i],
                              style: HelperFunctions.textstyle(),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: _allSelectedChoices[questionNumber] != 0
                                    ? (i ==
                                            (questions[questionNumber]
                                                    .correctOption -
                                                1)
                                        ? Colors.green
                                        : Colors.red)
                                    : Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius12),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Container(
                      height: Dimensions.height10 * 8,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
                      ),
                      child: isSliderOpen
                          ? FadeInRight(
                              from: 50,
                              duration: const Duration(milliseconds: 375),
                              animate: true,
                              child: Scrollbar(
                                child: GridView.builder(
                                  itemCount: questions.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    crossAxisSpacing: 7,
                                    mainAxisSpacing: 7,
                                    childAspectRatio: 1 / 1,
                                  ),
                                  itemBuilder: (_, idx) {
                                    return Material(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            HelperFunctions.getColor(
                                          _allSelectedChoices[idx],
                                        ),
                                        child: Center(
                                            child: Text(
                                          '${idx + 1}',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : null,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 1.6,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CustomButton(
                          backColor: Colors.purple,
                          onTaphandler: () {
                            setState(() {
                              isVideoSolenabled = !isVideoSolenabled;
                            });

                            //Video Controller start
                            flickManager = FlickManager(
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true',
                                // closedCaptionFile: _loadCaptions(),
                              ),
                            );
                          },
                          text: 'Video Solution',
                        ),
                        const Spacer(),
                        CustomButton(
                          // backColor: Color(0xffFAD207),
                          backColor: Colors.orange,
                          text: 'Mark as Imp',
                          onTaphandler: _allSelectedChoices[questionNumber] == 0
                              ? () {}
                              : () {
                                  setState(() {
                                    _allSelectedChoices[questionNumber] = 2;
                                  });
                                },
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CustomButton(
                          backColor: const Color(0xff0CBC8B),
                          onTaphandler: () {
                            if (questionNumber != 0) {
                              setState(() {
                                questionNumber--;
                                isOptionChosen = false;
                              });
                            }
                          },
                          text: 'Previous',
                        ),
                        const Spacer(),
                        CustomButton(
                          backColor: const Color(0xff000088),
                          onTaphandler: () {
                            if (questionNumber < questions.length - 1) {
                              setState(() {
                                questionNumber++;
                                isOptionChosen = false;
                                isVideoSolenabled = false;
                              });
                            }
                          },
                          text: 'Next',
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                  ],
                ),
              ),
            ),
            // isVideoSolenabled
            if (isVideoSolenabled)
              Container(
                color: Colors.black.withOpacity(0.8),
              ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isVideoSolenabled
                  ? Center(
                      child: Container(
                          margin: EdgeInsets.all(Dimensions.borderRadius15),
                          height: Dimensions.height10 * 22,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                Dimensions.borderRadius15),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                FlickVideoPlayer(
                                  flickManager: flickManager!,
                                  flickVideoWithControls:
                                      FlickVideoWithControls(
                                    controls: FlickPortraitControls(),
                                  ),
                                  flickVideoWithControlsFullscreen:
                                      FlickVideoWithControls(
                                    controls: FlickLandscapeControls(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )
                  : Container(),
            ),
            if (isVideoSolenabled)
              Positioned(
                top: 15.0,
                right: 15.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  tooltip: 'Close Video Solution',
                  onPressed: () {
                    setState(() {
                      isVideoSolenabled = false;
                    });
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

void showCustomSnackbar({
  required String text,
  required IconData icon,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      elevation: 5.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.borderRadius12),
      ),
      duration: const Duration(seconds: 1),
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: Dimensions.width10 * 2,
          ),
          Text(text),
        ],
      ),
    ),
  );
}
