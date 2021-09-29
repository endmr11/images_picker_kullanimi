import 'package:flutter/material.dart';
import 'dart:io';
import 'package:images_picker/images_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class VideoCekmeSayfasi extends StatefulWidget {
  const VideoCekmeSayfasi({Key? key}) : super(key: key);

  @override
  _VideoCekmeSayfasiState createState() => _VideoCekmeSayfasiState();
}

class _VideoCekmeSayfasiState extends State<VideoCekmeSayfasi> {
  late VideoPlayerController _controller;

  late String path;
  late bool isOpen = false;

  Future resimCek() async {
    List<Media>? res = await ImagesPicker.openCamera(
      pickType: PickType.video,
      quality: 0.5,
    );
    if (res != null) {
      setState(() {
        path = res[0].path;
      });
      videoBaslat();
      isOpen = true;
    }
  }

  void videoBaslat() {
    _controller = VideoPlayerController.file(File(path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Video Çekme",
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: isOpen == true
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Placeholder(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    resimCek();
                  },
                  child: Text(
                    "Video",
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: isOpen == true
            ? FloatingActionButton(
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
              )
            : null);
  }
}

/*
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

    _controller = VideoPlayerController.file(File(path))
      ..initialize().then((_) {
        setState(() {});
      });

 */