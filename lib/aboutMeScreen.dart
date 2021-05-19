import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import 'openWebBrowser.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://image.shutterstock.com/image-photo/image-happy-brunette-man-wearing-260nw-1489874846.jpg",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Harsh Kumar Khatri",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                child: Text(
                  "I am a CSE undergraduate from xyz university. I love to learn about new techs and explore different dynamics of it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Follow ME"),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      openWebBrower("https://twitter.com/harshkhatri24");
                    },
                    child: FaIcon(
                      FontAwesomeIcons.twitter,
                      size: 30,
                      color: Color.fromRGBO(40, 168, 237, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openWebBrower(
                          "https://www.youtube.com/channel/UCKNtMU9M559bmXxKoT6YeJw");
                    },
                    child: FaIcon(
                      FontAwesomeIcons.youtube,
                      size: 30,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openWebBrower("https://github.com/harshkumarkhatri");
                    },
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      size: 30,
                      color: Color.fromRGBO(14, 118, 168, 1),
                    ),
                  ),
                  // Add more profiles from here
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Share.share(
                      "Want to get updates about latest things taking place in tech?\nDownload the app now: <AppLink>",
                    );
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Share the App",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
