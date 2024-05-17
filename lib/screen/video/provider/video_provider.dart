import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPLayerController;
  ChewieController? chewieController;

  void playvideo() {
    videoPLayerController!.initialize();
    videoPLayerController= VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
   if(chewieController!=null){
     chewieController = ChewieController(
         videoPlayerController: videoPLayerController!, autoPlay: true);
   }
    notifyListeners();
  }
}
