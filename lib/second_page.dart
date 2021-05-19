// import 'package:audioplayers/audioplayers.dart';
// import 'package:demoapp_to_be_del/main.dart';
// import 'package:flutter/material.dart';

// class SecondPage extends StatefulWidget {
//   SecondPage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   int _counter = 0;
//   bool playing = false;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   BaDumTss instance;
//   AudioPlayer audioPlayer;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     instance = getIt<BaDumTss>();
//     audioPlayer = instance.audio;
//     print("reinitia");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Second Page',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//             ),
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 35.0,
//                   color: Colors.blue),
//             ),
//             GestureDetector(
//               onTap: () {
//                 playing == false
//                     ? audioPlayer.play(
//                         "https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3",
//                       )
//                     : print("Already playing a song");
//                 setState(() {
//                   playing = true;
//                 });
//                 print("playing");
//                 print(
//                   audioPlayer
//                       .play(
//                         "https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3",
//                       )
//                       .then(
//                         (value) => print(
//                           value,
//                         ),
//                       ),
//                 );
//               },
//               child: Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Hello",
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () async {
//                 print(instance);

//                 print(audioPlayer);
//                 await audioPlayer.pause();
//                 audioPlayer.stop();
//                 print(audioPlayer.pause().then((value) => print(value)));
//                 print("Yha pause hua hai");
//               },
//               child: Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Hello",
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MusicPlayerScreen2 extends StatefulWidget {
  @override
  _MusicPlayerScreen2State createState() => _MusicPlayerScreen2State();
}

class _MusicPlayerScreen2State extends State<MusicPlayerScreen2> {
  List music = [
    {
      "title": "Tech House vibes",
      "singer": "Alejandro Magaña (A. M.)",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      "coverUrl":
          "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1621057519/music%20app/download_ezpkhj.jpg"
    },
    {
      "title": "Hazy After Hours",
      "singer": "Alejandro Magaña",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3",
      "coverUrl":
          "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1621057509/music%20app/download_1_ooio6l.jpg"
    },
    {
      "title": "Hip Hop 02",
      "singer": "Lily J",
      "url": "https://assets.mixkit.co/music/preview/mixkit-hip-hop-02-738.mp3",
      "coverUrl":
          "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1621057509/music%20app/download_2_awf0yr.jpg"
    },
    {
      "title": "A Very Happy Christmas",
      "singer": "Michael Ramir C.",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3",
      "coverUrl":
          "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1621057508/music%20app/download_3_gvodu0.jpg"
    },
  ];

  BaDumTss instance;
  AudioPlayer audioPlayer;

  String currentCover = "";
  String currentTitle = "";
  String currentSinger = "";
  String url = "";

  Duration duration = new Duration();
  Duration position = new Duration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instance = getIt<BaDumTss>();
    audioPlayer = instance.audio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MUsic",
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => customListItem(
                  title: music[index]['title'],
                  singer: music[index]['singer'],
                  cover: music[index]['coverUrl'],
                  onTap: () async {
                    // await storage.write(key: "url", value: music[index]['url']);
                    // await storage.write(
                    //     key: "currentSinger", value: music[index]['singer']);
                    // await storage.write(
                    //     key: "currentTitle", value: music[index]['title']);
                    // await storage.write(
                    //     key: "currentCover", value: music[index]['coverUrl']);
                    // await storage.write(key: "currentSong", value: value);
                    // await storage.write(key: "isPlaying", value: value);
                    setState(() {
                      currentCover = music[index]['coverUrl'];
                      currentSinger = music[index]["singer"];
                      url = music[index]["url"];
                      currentTitle = music[index]['title'];
                      // audioPlayerBloc.url = music[index]['url'];
                      // audioPlayerBloc.currentCover = music[index]['coverUrl'];
                      // audioPlayerBloc.currentSinger = music[index]['singer'];
                      // audioPlayerBloc.currentTitle = music[index]['title'];
                    });
                    // print(audioPlayerBloc.url);
                    print("is url");
                    // playMusic(
                    //   audioPlayerBloc.url,
                    // );
                    print(music[index]['url']);
                    // audioPlayerBloc.eventSink.add(BlogAppAction.play);
                    // await storage.write(key: "areAssigned", value: "true");
                    // await storage.write(
                    //   key: "url",
                    //   value: music[index]['url'],
                    // );
                    // await storage.write(
                    //   key: "currentCover",
                    //   value: music[index]['coverUrl'],
                    // );
                    // await storage.write(
                    //   key: "currentSinger",
                    //   value: music[index]['singer'],
                    // );
                    // await storage.write(
                    //   key: "currentTitle",
                    //   value: music[index]['title'],
                    // );
                    audioPlayer.play(url);
                  },
                ),
                itemCount: music.length,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(
                      0x55212121,
                    ),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Slider.adaptive(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      print("Value is $value");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(position.inSeconds.toDouble().toString()),
                        Text(duration.inSeconds.toDouble().toString())
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: 12,
                      right: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                // audioPlayerBloc.currentCover,
                                currentCover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // audioPlayerBloc.currentTitle ?? "",
                                currentTitle,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                // audioPlayerBloc.currentSinger ?? "",
                                currentSinger,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      print(instance);

                      print(audioPlayer);
                      await audioPlayer.pause();
                      audioPlayer.stop();
                      print(audioPlayer.pause().then((value) => print(value)));
                      print("Yha pause hua hai");
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          "Hello",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget customListItem({
    String title,
    String singer,
    String cover,
    onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  singer,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
