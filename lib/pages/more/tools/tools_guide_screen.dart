import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

class ToolsGuide extends StatelessWidget {
  static const routeName = "/tools";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: User.darkKnightMode ? veryDarkTheme : menuAcTheme,
        title: Text("Tools durability", style: TextStyle(fontFamily: 'Fink',),),
      ),
      body: Container(
        color: User.darkKnightMode ? menuDarkTheme : acTheme,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(child: 
                Text("Axes", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Flimsy_axe.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("40 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Stone_axe.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("100 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Axe.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("100 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_axe.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("200 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(child: 
                Text("Nets", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Flimsy_net.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("10 catches", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Net.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("30 catches.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_net.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("90 catches.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(child: 
                Text("Rods", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Flimsy_fishing_rod.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("5-10 catches.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Fishing_rod.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("30 catches.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_rod.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("90 catches.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(child: 
                Text("Shovel", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Flimsy_shovel.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("40 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Shovel.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("100 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_shovel.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("200 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(child: 
                Text("Slingshot", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Slingshot.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("20 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_slingshot.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("60 hits.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(child: 
                Text("Watering can", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black, fontSize: 28),),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Flimsy_watering_can.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("20 uses.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Watering_can.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("60 uses.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                    TableRow(children: <Widget>[
                      Container(
                        child: Image.asset(
                          "res/tools/NH-Golden_watering_can.png",
                          height: 100,
                        ),
                      ),
                      Center(child: Text("180 uses.", style: TextStyle(fontFamily: 'Fink',
                  color: User.darkKnightMode ? textDarkTheme : Colors.black,))),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
