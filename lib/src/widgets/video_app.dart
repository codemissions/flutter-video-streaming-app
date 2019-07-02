import 'package:flutter/material.dart';
import '../models/video_info.dart';
import 'video_list.dart';

class VideoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  var videos = <VideoInfo>[
    VideoInfo(
      title: 'Butterfly',
      coverImageUrl: 'https://i.vimeocdn.com/video/530125963_640x360.jpg',
      videoImageUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ),
    VideoInfo(
      title: 'Big Buck Bunny',
      coverImageUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg',
      videoImageUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
    VideoInfo(
      title: 'Elephant\'s Dream',
      coverImageUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg',
      videoImageUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoList(
        videos: videos,
        onVideoAdded: (video) {
          setState(() => videos.add(video));
        },
        onVideoEdited: (video, index) {
          setState(() => videos[index] = video);
        },
      ),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
      ),
    );
  }
}
