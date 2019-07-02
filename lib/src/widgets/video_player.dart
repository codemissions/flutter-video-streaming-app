import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video_info.dart';

class VideoPlayer extends StatefulWidget {
  final VideoInfo video;

  const VideoPlayer({Key key, @required this.video}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController chewieCtrl;
  VideoPlayerController videoPlayerCtrl;

  @override
  void initState() {
    super.initState();
    videoPlayerCtrl = VideoPlayerController.network(widget.video.videoImageUrl);
    chewieCtrl = ChewieController(
      videoPlayerController: videoPlayerCtrl,
      autoPlay: true,
      aspectRatio: 3 / 2,
      placeholder: Center(
        child: Image.network(widget.video.coverImageUrl),
      ),
    );
  }

  @override
  void dispose() {
    chewieCtrl.dispose();
    videoPlayerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Chewie(
        controller: chewieCtrl,
      ),
    );
  }
}
