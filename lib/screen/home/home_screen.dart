import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../music/provider/music_provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR=context.read<MusicProvider>();
    providerW=context.watch<MusicProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: const Text(
          "Welcome",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text("Music")),
                TextButton(onPressed: () {}, child: const Text("Discover")),
                TextButton(onPressed: () {
                Navigator.pushNamed(context, 'video');
                }, child: const Text("video")),
                TextButton(onPressed: () {}, child: const Text("Podcast")),
                TextButton(onPressed: () {}, child: const Text("Artists")),
              ],
            ),
            CarouselSlider.builder(
              itemCount: 4,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  initialPage: 0,
                  padEnds: true,
                  disableCenter: true,
                  reverse: true),
              itemBuilder: (context, index, realIndex) => Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color:
                    index % 2 == 0 ? Colors.black : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "For You",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton.filledTonal(
                    onPressed: () {}, icon: const Icon(Icons.downloading_sharp))
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(itemCount: providerW!.l1.length,itemBuilder: (context, index) {
                return ListTile(
                  onTap:  () {
                    providerR!.changeIndex(index);
                    Navigator.pushNamed(context, 'music',arguments: index);
                  },
                  tileColor: Colors.white,
                  title:  Text("${providerW!.l1[index].Sname}"),
                  subtitle: Text("${providerW!.l1[index].SingerName}"),
                  leading:  CircleAvatar(backgroundImage: AssetImage('${providerW!.l1[index].img}'),radius: 25,),
                  hoverColor: Colors.black,
                  trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}