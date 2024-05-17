import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../../modal/music_modal.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer audioplayer = AssetsAudioPlayer();
  Duration current = Duration(seconds: 0);
  Duration live = Duration();
  int h=0,m=0,s=0;
  bool isPlay= false;
  int songIndex=0;

  List<MusicModal> l1=[
    MusicModal(
      Sname: 'Jamal Kudu',
     SingerName: 'Arijit Singh',
     song: 'https://pagalfree.com/musics/128-Abrars Entry Jamal Kudu - Animal 128 Kbps.mp3' ,
      img: 'assets/img/jamalkudu.jpeg'
    ),
    MusicModal(
      Sname: 'Mili Toh Maari Nahi',
      song: 'https://pagalfree.com/musics/128-Mili Toh Maari Nahi Toh Bramhachari - Perfect Plan 128 Kbps.mp3',
      SingerName: 'Honey Singh',
      img: 'assets/img/militomarinahi.jpeg'
    ),
    MusicModal(
      Sname: 'khali bottle',
      song: 'https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3',
      SingerName: 'badshah',
      img: 'assets/img/khalibottle.webp'
    ),
    MusicModal(
      Sname: 'Rabba Mereya',
      song: 'https://pagalfree.com/musics/128-Rabba Mereya - B Praak 128 Kbps.mp3',
      SingerName: 'B Praak',
      img: 'assets/img/rabbamereya.jpeg'
    ),
    MusicModal(
      Sname: 'Main Yaad Aaunga',
      song: 'https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3',
      SingerName: 'Sanjeev Chaturvedi',
      img: 'assets/img/mainyaadaunga.jpeg'
    ),
    MusicModal(
      Sname: 'Tilasmi Bahein',
      song: 'https://pagalfree.com/musics/128-Tilasmi Bahein - Heeramandi 128 Kbps.mp3',
      SingerName: 'Sanjay Leela Bansali',
      img: 'assets/img/tilasmi.jpeg',

    ),

  ];

  void playpause()
  {
    isPlay = !isPlay;
    notifyListeners();
  }

  void changeIndex(int index)
  {
    songIndex=index;
  }
  void liveTime()
  {
    audioplayer.currentPosition.listen((event) {
      live = event;
      notifyListeners();
    });
  }
  void currentTime()
  {
    audioplayer.current.listen((event) {
      current=event!.audio.duration;
      if (current.inSeconds>=60)
      {
        s=current.inSeconds;

        m=s~/60;
        s=s-(m*60);
        if(m>=60)
        {
          h=m~/60;
          m=m-(h*60);
        }
      }
      notifyListeners();
    });
  }

  void changemusic() {
    audioplayer.open(
      Playlist(audios: l1.map((e)=>Audio.network(e.song!)).toList(),startIndex: songIndex),
      autoStart: true,
    );
    currentTime();
    notifyListeners();
  }
}