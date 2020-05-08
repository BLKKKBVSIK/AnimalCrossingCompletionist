import 'package:animal_crossing_completion/pages/board_pages/name.dart';
import 'package:flutter/material.dart';

class FirstBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('res/fishtuto.png'),
          new Flexible(
              flex: 1,
              child: new Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: new AssetImage('res/fond.png')),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Keep track of all",
                                  style: new TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                              new Text("collectibles of",
                                  style: new TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                              new Text("Animal Crossing: New Horizon",
                                  style: new TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text(''),
                            new Expanded(
                              child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: new Container(
                                      margin: new EdgeInsets.only(
                                          left: 16.0, right: 16.0, top: 24.0),
                                      child: new RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(NameInput.routeName);
                                        },
                                        color: Colors.black,
                                        child: new ListTile(
                                          title: new Text('Next',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)),
                                          trailing: new Icon(Icons.arrow_forward,
                                              color: Colors.white),
                                        ),
                                      ))),
                            )
                          ],
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}