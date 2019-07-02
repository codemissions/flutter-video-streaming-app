import 'package:flutter/material.dart';
import '../models/video_info.dart';

class VideoDialog extends StatefulWidget {
  final String title;
  final void Function(VideoInfo) onSubmit;
  final VideoInfo video;

  const VideoDialog(
      {Key key, @required this.title, @required this.onSubmit, this.video})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  var titleCtrl = TextEditingController();
  var imageUrlCtrl = TextEditingController();
  var videoUrlCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.video != null) {
      setState(() {
        titleCtrl.text = widget.video.title;
        imageUrlCtrl.text = widget.video.coverImageUrl;
        videoUrlCtrl.text = widget.video.videoImageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: titleCtrl,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextFormField(
            controller: imageUrlCtrl,
            decoration: InputDecoration(hintText: 'Cover Image'),
          ),
          TextFormField(
            controller: videoUrlCtrl,
            decoration: InputDecoration(hintText: 'Video URL'),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('SUBMIT'),
          onPressed: () {
            Navigator.pop(context);
            final VideoInfo video = 
                  VideoInfo(
                    title: titleCtrl.text,
                    coverImageUrl: imageUrlCtrl.text,
                    videoImageUrl: videoUrlCtrl.text,
                  );
            widget.onSubmit(video);
          },
        ),
      ],
    );
  }
}
