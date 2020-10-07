import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:play_video_mp3/screens/audio/audio_asset.dart';
import 'package:play_video_mp3/screens/audio/audio_local.dart';
import 'package:play_video_mp3/screens/audio/audio_network.dart';
import 'package:play_video_mp3/screens/video/video_asset.dart';
import 'package:play_video_mp3/screens/video/video_local.dart';
import 'package:play_video_mp3/screens/video/video_network.dart';
import 'package:play_video_mp3/widget/button.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Video MP3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// todo: source https://medium.com/@KarthikPonnam/flutter-media-playback-audio-video-43d3ba955bb7
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NormalButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoNetWord()));
            },title: 'Video Network',),
            SizedBox(height: 20,),
            NormalButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoAsset()));
            },title: 'Video Asset',),
            SizedBox(height: 20,),
            NormalButton(onPressed: (){
              _pickVideoFileFrom(context);
            },title: 'Video Local',),
            SizedBox(height: 20,),
            NormalButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioNetwork()));
            },title: 'Audio Network',),
            SizedBox(height: 20,),
            NormalButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioAsset()));
            },title: 'Audio Asset',),
            SizedBox(height: 20,),
            // NormalButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioLocal()));
            // },title: 'Audio Local ',),
            NormalButton(onPressed: (){
              _pickAudioFileFrom(context);
            },title: 'Audio Local',),

          ],
        ),
      ),
    );
  }
  _pickAudioFileFrom(context) async {
    File audioFile = await FilePicker.getFile(type: FileType.audio);
    if (audioFile == null) {
      print("Audio Picked is null");
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AudioLocal(
        file: audioFile,
      );
    }));
  }
  _pickVideoFileFrom(context) async {

     File videoFile = await FilePicker.getFile(type: FileType.video);
    if (videoFile == null) {
      print("Video Picked is null");
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return VideoLocal(
        file: videoFile,
      );
    }));
  }
}
