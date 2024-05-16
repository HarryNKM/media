import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch()<VideoProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent.shade200,
        title: const Text(
          "VIDEO",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Chewie(
        controller: providerW!.chewieController!,
      ),
    );
  }
}
