import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MusicProvider>().isPlay=true;
    context.read<MusicProvider>().changemusic();
    context.read<MusicProvider>().liveTime();

  }
  @override
  Widget build(BuildContext context) {
    providerR=context.read<MusicProvider>();
    providerW=context.watch<MusicProvider>();

    int index =ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent.shade200,
        title: const Text(
          "MUSIC",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.white,
              child: Image.asset("${providerW!.l1[index].img}",fit: BoxFit.cover,)
            ),
            const SizedBox(
              height: 25,
            ),
             Text(
              "${providerW!.l1[index].Sname}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
             Text(
              "${providerW!.l1[index].SingerName}",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.loop,
                  size: 25,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  providerW!.audioplayer.previous();

                },
                icon: const Icon(
                  Icons.skip_previous_outlined,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  if(providerW!.isPlay)
                 {
                   providerW!.audioplayer.pause();
                   providerR!.playpause();
                 }
               else
                 {
                   providerW!.audioplayer.play();
                   providerR!.playpause();
                 }

                },
                icon:  Icon(
                  providerW!.isPlay?Icons.pause:Icons.play_arrow,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  providerW!.audioplayer.next();
                },
                icon: const Icon(
                  Icons.skip_next_outlined,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle,
                  size: 25,
                  color: Colors.grey,
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${providerW!.live.inHours}:${providerW!.live.inMinutes}:${providerW!.live.inSeconds}"),
                SizedBox(
                  width: 310,
                  child: Slider(
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      providerW!.audioplayer.seek(Duration(seconds: value.toInt()));
                    },
                    value: providerW!.live.inSeconds.toDouble(),
                    max: providerW!.current.inSeconds.toDouble(),
                  ),
                ),
                Text("${providerW!.h}:${providerW!.m}:${providerW!.s}"),
              ],
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Image.asset("assets/images/arijit2.jpg"),