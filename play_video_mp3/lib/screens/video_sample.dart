import 'package:flutter/material.dart';
import 'package:play_video_mp3/widget/basewidget.dart';
import 'package:video_player/video_player.dart';

class SampleVideo extends StatefulWidget {
  @override
  _SampleVideoState createState() => _SampleVideoState();
}

class _SampleVideoState extends State<SampleVideo> {
  VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar('Sample Video'),
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(
          child: Text('Loading....'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
