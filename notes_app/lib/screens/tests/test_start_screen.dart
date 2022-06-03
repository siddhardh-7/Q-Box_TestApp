import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../helpers/helpers.dart';
import '../../provider/data_provider.dart';
import '../../widgets/custom_button.dart';

class TestStartScreen extends StatefulWidget {
  const TestStartScreen({Key? key}) : super(key: key);

  static const routeName = '/Test-Start-Screen';

  @override
  State<TestStartScreen> createState() => _TestStartScreenState();
}

class _TestStartScreenState extends State<TestStartScreen> {
  int questionNumber = 0;
  bool isOptionChosen = false;
  bool isVideoSolenabled = false;
  final List<int> _allSelectedChoices = List.filled(20, 0);

  VideoPlayerController? _controller;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Questions> questions = Provider.of<Data>(context).testQuestions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, right: 18.0, top: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.all(0.0),
                          splashRadius: 25.0,
                          icon: const Icon(Icons.keyboard_arrow_left_rounded),
                        ),
                        const Text(
                          'Test Name',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 15.0,
                          child: Icon(Icons.person),
                        )
                      ],
                    ),
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${questionNumber + 1}.  ${questions[questionNumber].question}',
                          style: HelperFunctions.textstyle(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 4; i++)
                      InkWell(
                        onTap: () {
                          if (_allSelectedChoices[questionNumber] == 0 ||
                              _allSelectedChoices[questionNumber] == 2) {
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
                                  context: context);
                            } //if wrong
                            else {
                              setState(() {
                                _allSelectedChoices[questionNumber] = -1;
                              });
                              showCustomSnackbar(
                                  text: 'Wrong',
                                  icon: Icons.close,
                                  context: context);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(6.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 375),
                          padding: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            questions[questionNumber].options[i],
                            style: isOptionChosen
                                ? HelperFunctions.textstyleWhite()
                                : HelperFunctions.textstyle(),
                          ),
                          decoration: BoxDecoration(
                            color: _allSelectedChoices[questionNumber] != 0 &&
                                    _allSelectedChoices[questionNumber] != 2
                                ? (i ==
                                        (questions[questionNumber]
                                                .correctOption -
                                            1)
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white,
                            border: Border.all(
                              color: isOptionChosen
                                  ? (i ==
                                          (questions[questionNumber]
                                                  .correctOption -
                                              1)
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.grey.withOpacity(0.8),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: 122,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
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
                              return Scrollbar(
                                child: Container(
                                  margin: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: HelperFunctions.getColorTests(
                                        _allSelectedChoices[idx]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CustomButton(
                          backColor: Colors.purple,
                          onTaphandler: () {
                            setState(() {
                              _allSelectedChoices[questionNumber] = 2;
                            });
                          },
                          text: 'Save for Later',
                        ),
                        if (questionNumber == questions.length - 1)
                          const Spacer(),
                        if (questionNumber == questions.length - 1)
                          CustomButton(
                              // backColor: Color(0xffFAD207),
                              backColor: const Color(0xff076AFE),
                              text: 'Submit',
                              onTaphandler: () {}),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
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
                        margin: const EdgeInsets.all(15.0),
                        height: 220,
                        width: double.infinity,
                        child: _controller!.value.isInitialized
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    AspectRatio(
                                      aspectRatio:
                                          _controller!.value.aspectRatio,
                                      child: VideoPlayer(_controller!),
                                    ),
                                    Positioned(
                                      bottom: 5.0,
                                      left: 5.0,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _controller!.value.isPlaying
                                                ? _controller!.pause()
                                                : _controller!.play();
                                          });
                                        },
                                        icon: Icon(
                                          _controller!.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                      ),
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration: const Duration(seconds: 1),
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(text),
        ],
      ),
    ),
  );
}
