import 'package:flutter/material.dart';
import '../models/video_info.dart';
import 'video_dialog.dart';
import 'video_player.dart';

class VideoListTile extends StatelessWidget {
  final VideoInfo video;
  final void Function(VideoInfo) onChange;

  const VideoListTile({Key key, @required this.video, @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return VideoDialog(
              title: 'Edit ${video.title}',
              video: video,
              onSubmit: onChange,
            );
          },
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(video.coverImageUrl),
                IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  iconSize: 64,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return VideoPlayer(
                            video: video,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: Text(video.title),
              subtitle: Text(Uri.parse(video.videoImageUrl).host),
            ),
          ],
        ),
      ),
    );
  }
}
