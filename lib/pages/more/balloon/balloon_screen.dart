import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

class BalloonScreen extends StatelessWidget {
  static const routeName = '/balloon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Balloon Guide", style: TextStyle(fontFamily: 'Fink',),),
          backgroundColor: User.darkKnightMode ? veryDarkTheme : menuAcTheme),
      body: Container(
        color: User.darkKnightMode ? menuDarkTheme : acTheme,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Balloons seem to float randomly over the town, but they actually originate on the edges of the map at specific times.\n\nEvery time the player is outside and the time's final digit is a '4', a balloon has a chance to appear; for example, a balloon could appear at 3:14, 5:54, 12:34 or 1:04, but they will not appear at times like 4:33, 7:28.",
                          style: TextStyle(
                              fontSize: 18,
                              color: User.darkKnightMode
                                  ? textDarkTheme
                                  : Colors.black)),
                    ],
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "res/balloons/redballoon.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("When a red balloon pop,\n you'll get a recipe.", style: TextStyle(color: User.darkKnightMode ? textDarkTheme : Colors.black, ))),
                    ]),
                    TableRow(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "res/balloons/blueballoon.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("When a blue balloon pop,\n you'll get crafting materials.", style: TextStyle(color: User.darkKnightMode ? textDarkTheme : Colors.black, ))),
                    ]),
                    TableRow(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "res/balloons/greenballoon.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("When a green balloon pop,\n you'll get a piece of furniture.", style: TextStyle(color: User.darkKnightMode ? textDarkTheme : Colors.black, ))),
                    ]),
                    TableRow(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "res/balloons/yellowballoon.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("When a yellow balloon pop,\n you'll get bells.", style: TextStyle(color: User.darkKnightMode ? textDarkTheme : Colors.black, ))),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
