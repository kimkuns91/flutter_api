import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});
  static const route = "/videoapp";

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool _isLoading = true; // 로딩 상태를 추적하는 플래그

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://storage.cloud.google.com/white_mouse_dev/lectures/VID_20231008_235422_00_037.mp4',
      ),
    );

    _controller.initialize().then((_) {
      setState(() {
        _isLoading = false; // Set to false when the video is ready
      });
    }).catchError((error) {
      setState(() {
        _isLoading =
            false; // Also set to false on error, possibly set an error message
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: _isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Display while loading
                  : _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(), // Show empty container if not initialized
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.dispose();
    super.dispose();
  }
}
