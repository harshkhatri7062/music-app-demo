import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'main.dart';

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: WebviewScaffold(
        url: "https://mailharshkhatri.medium.com",
        initialChild: Center(child: CircularProgressIndicator()),
      ),
    );

    // GestureDetector(
    //   onTap: () async {
    //     final instance = getIt<BaDumTss>();
    //     print(instance);

    //     final audioPlayer = instance.pause1();
    //     print(audioPlayer);
    //     await audioPlayer.pause1();
    //     audioPlayer.stop();
    //     print(audioPlayer.pause().then((value) => print(value)));
    //     print("Yha pause hua hai");
    //   },
    //   child: Container(
    //     height: 55,
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //     ),
    //     child: Center(
    //       child: Text(
    //         "Hello",
    //       ),
    //     ),
    //   ),
    // );
  }
}
