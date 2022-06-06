import 'package:flick_video_player/flick_video_player.dart';
import 'package:notes_app/screens/tabs_screen.dart';
import 'package:notes_app/utilities/dimensions.dart';
import 'package:notes_app/widgets/appbar_actions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '../../bin/video_player.dart';
import '../../helpers/helpers.dart';
import '../../provider/data_provider.dart';
import '../../widgets/message_bubble.dart';

class LiveVideoPlayScreen extends StatefulWidget {
  const LiveVideoPlayScreen({Key? key}) : super(key: key);
  static const String routeName = '/live-video-play-screen';

  @override
  State<LiveVideoPlayScreen> createState() => _LiveVideoPlayScreenState();
}

class _LiveVideoPlayScreenState extends State<LiveVideoPlayScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true',
        // closedCaptionFile: _loadCaptions(),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Messages> messages = Provider.of<Data>(context).messages;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: Dimensions.padding20),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, TabsScreen.routeName);
              },
              child: Text(
                'Live Video',
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          AppBarProfileIcon(),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.padding20 * (3 / 4),
              right: Dimensions.padding20 * (3 / 4),
              top: Dimensions.padding20 * (3 / 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimensions.height10 * 25,
                  padding: EdgeInsets.all(Dimensions.padding20 / 4),
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: FlickVideoWithControls(
                      controls: FlickPortraitControls(),
                    ),
                    flickVideoWithControlsFullscreen: FlickVideoWithControls(
                      controls: FlickLandscapeControls(),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10 * 2,
                ),
                Text(
                  'Live Chat',
                  style: HelperFunctions.textStyleCard(),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.padding20 / 2.5),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoTextField(
                      clearButtonMode: OverlayVisibilityMode.editing,
                      placeholder: 'Type a message...',
                      placeholderStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                        color: theme.hintColor,
                      ),
                      strutStyle: const StrutStyle(
                        fontFamily: 'Quicksand',
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10 * 2.5,
                          vertical: Dimensions.height10 * 1.2),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius5 * 2),
                        color: theme.cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          )
                        ],
                      ),
                      style: TextStyle(
                        color: theme.hintColor,
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        isMe: messages[index].isMe,
                        message: messages[index].message,
                      );
                    },
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
