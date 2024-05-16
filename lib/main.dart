import 'package:flutter/material.dart';
import 'package:music/routes.dart';
import 'package:music/screen/music/provider/music_provider.dart';
import 'package:music/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: MusicProvider(),
      ),
       ChangeNotifierProvider.value(value: VideoProvider(),
       ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  ));
}
