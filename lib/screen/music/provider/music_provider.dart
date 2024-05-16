import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer audioplayer = AssetsAudioPlayer();
  Duration current = Duration(seconds: 0);
  Duration live = Duration();
  int h=0,m=0,s=0;
  bool isPlay= false;

  void playpause()
  {
    isPlay = !isPlay;
    notifyListeners();
  }
  void liveTime()
  {
    audioplayer.currentPosition.listen((event) {
      live = event;
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
      Playlist(audios: [
        Audio.network("https://pagalfree.com/musics/128-Abrars Entry Jamal Kudu - Animal 128 Kbps.mp3"),
        Audio.network("https://pagalfree.com/musics/128-Mili Toh Maari Nahi Toh Bramhachari - Perfect Plan 128 Kbps.mp3"),
        Audio.network("https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3"),
      ]),
      autoStart: true,
    );
    notifyListeners();
  }
}