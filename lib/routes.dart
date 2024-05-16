import 'package:flutter/material.dart';
import 'package:music/screen/home/home_screen.dart';
import 'package:music/screen/music/view/music_screen.dart';
import 'package:music/screen/video/view/video_screen.dart';


Map<String,WidgetBuilder> app_routes={
  '/':(context) => const ListScreen(),
  'music':(context) => const MusicScreen(),
  'video':(context) => const VideoScreen(),
};