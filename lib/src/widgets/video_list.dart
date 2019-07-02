import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/video_info.dart';
import 'video_dialog.dart';
import 'video_list_tile.dart';

class VideoList extends StatelessWidget {
  final Iterable<VideoInfo> videos;
  final void Function(VideoInfo) onVideoAdded;
  final void Function(VideoInfo, int) onVideoEdited;

  const VideoList(
      {Key key,
      @required this.videos,
      @required this.onVideoAdded,
      @required this.onVideoEdited})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(constraints.maxWidth, 32),
            child: Material(
              color: Colors.grey[800],
              child: Padding(
                padding: EdgeInsets.all(8).copyWith(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.live_tv),
                    Text(
                      ' FTube',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              var video = videos.elementAt(index);
              return VideoListTile(
                video: video,
                onChange: (v) => onVideoEdited(v, index),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return VideoDialog(
                    title: 'Add a New Video',
                    onSubmit: onVideoAdded,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
