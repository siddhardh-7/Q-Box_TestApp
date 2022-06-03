import 'package:flick_video_player/flick_video_player.dart';
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Live Video',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(DefaultPlayer.routeName);
                      },
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
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(5.0),
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Live Chat',
                  style: HelperFunctions.textStyleCard(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
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
                  height: 10,
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
