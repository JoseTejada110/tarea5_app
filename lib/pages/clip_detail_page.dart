import 'package:flutter/material.dart';
import 'package:tarea5_app/constants.dart';
import 'package:video_player/video_player.dart';

class ClipDetailPage extends StatefulWidget {
  const ClipDetailPage({
    Key? key,
    required this.clipName,
    required this.pathToVideo,
    required this.description,
  }) : super(key: key);
  final String clipName;
  final String pathToVideo;
  final String description;

  @override
  State<ClipDetailPage> createState() => _ClipDetailPageState();
}

class _ClipDetailPageState extends State<ClipDetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.pathToVideo)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text(
          widget.clipName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _controller.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),

            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Contexto:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
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
}
