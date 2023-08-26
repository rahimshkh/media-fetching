import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final File file;

  const CustomVideoPlayer({super.key, required this.file});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  @override
  void initState() {
    controller = VideoPlayerController.file(widget.file)..initialize();
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoInitialize: true,
      autoPlay: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController?.pause();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: chewieController!);
  }
}
