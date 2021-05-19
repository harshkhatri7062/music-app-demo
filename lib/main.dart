import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:demoapp_to_be_del/aboutMeScreen.dart';
import 'package:demoapp_to_be_del/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'first_page.dart';

void main() {
  setup();
  runApp(MyApp());
  WidgetsBinding.instance.addObserver(_Handler());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class BaDumTss {
  AudioPlayer _audio = AudioPlayer();
  BaDumTss() {
    print("Instance created");
    _audio = AudioPlayer();
  }

  AudioPlayer get audio => _audio;

  pause1() {
    audio.pause();
    print("Yo i am in pause");
  }
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(() => BaDumTss());
  print("Registered");
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  // List<Widget> pageList = List<Widget>();
  final pageList = <Widget>[];

  @override
  void initState() {
    pageList.add(MyApp2());
    pageList.add(AboutMe());
    pageList.add(MusicPlayerScreen2());
  }

  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: pageList,
        controller: controller,
      ),
      // IndexedStack(
      //   index: _selectedPage,
      //   children: pageList,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('First Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('About me'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('Second Page'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      controller.jumpToPage(
        _selectedPage,
      );
    });
  }
}

class _Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Inside the handler 1");
    if (state == AppLifecycleState.resumed) {
      // AudioPlayer()
      //     .resume(); // Audio player is a custom class with resume and pause static methods
      print("If 1");
    } else {
      print("else 1");
      AudioPlayer().pause();
      AudioPlayer().release();
    }
  }
}
