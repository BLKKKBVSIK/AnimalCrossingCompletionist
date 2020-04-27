import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/pages/more/balloon/balloon_screen.dart';
import 'package:animal_crossing_completion/pages/more/flowers/flowers_guide_screen.dart';
import 'package:animal_crossing_completion/pages/more/tools/tools_guide_screen.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

class MoreGuides extends StatelessWidget {
  static const String routeName = '/guides';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: User.darkKnightMode ? veryDarkTheme : menuAcTheme,
        title: Text("More guides",
            style: TextStyle(
              fontFamily: 'Fink',
            )),
      ),
      body: Container(
          color: User.darkKnightMode ? menuDarkTheme : acTheme,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              InkWell(
                onTap: () => {
                  Navigator.of(context).pushNamed(BalloonScreen.routeName),
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'res/balloons/redballoon.png',
                        height: 60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Text(
                          "Balloon guide",
                          style: TextStyle(
                              fontFamily: 'Fink',
                              color: User.darkKnightMode
                                  ? textDarkTheme
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: User.darkKnightMode
                          ? secondaryDarkTheme
                          : Colors.white,
                      image: User.darkKnightMode
                          ? null
                          : new DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage('res/fond.png'))),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.of(context).pushNamed(ToolsGuide.routeName),
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'res/tools/NH-Axe.png',
                        height: 60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Text(
                          "Tool durability",
                          style: TextStyle(
                              fontFamily: 'Fink',
                              color: User.darkKnightMode
                                  ? textDarkTheme
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: User.darkKnightMode
                          ? secondaryDarkTheme
                          : Colors.white,
                      image: User.darkKnightMode
                          ? null
                          : new DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage('res/fond.png'))),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.of(context).pushNamed(FlowerGuide.routeName),
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'res/flowers/NH-orange_lily_icon.png',
                        height: 60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Text(
                          "Flowers guide",
                          style: TextStyle(
                              fontFamily: 'Fink',
                              color: User.darkKnightMode
                                  ? textDarkTheme
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: User.darkKnightMode
                          ? secondaryDarkTheme
                          : Colors.white,
                      image: User.darkKnightMode
                          ? null
                          : new DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage('res/fond.png'))),
                ),
              ),
            ],
          )),
    );
  }
}
