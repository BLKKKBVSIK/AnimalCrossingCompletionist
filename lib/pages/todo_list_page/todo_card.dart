import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../misc/io_manager.dart';
import '../../logic/task.dart';
import '../../user.dart';

import 'package:share/share.dart';

class TodoCard extends StatefulWidget {
  Task task;
  State state;
  int tab;
  TodoCard(this.task, this.state, this.tab);

  @override
  _TodoCardState createState() => new _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: User.darkKnightMode ? menuDarkTheme : acTheme,
      ),
      child: new Container(
        margin: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
        child: new Material(
            color: Colors.transparent,
            child: new Material(
              color: Colors.transparent,
              child: new InkWell(
                onTap: () {
                  setState(() => widget.task.done = !widget.task.done);

                  if (widget.task.done) {
                    if (widget.tab == 1) {
                      User.completedFish.add(widget.task);
                    } else if (widget.tab == 2) {
                      User.completedBugs.add(widget.task);
                    } else if (widget.tab == 3) {
                      User.completedFossils.add(widget.task);
                    } else if (widget.tab == 4) {
                      User.completedArt.add(widget.task);
                    }
                    User.completedTasks.add(widget.task);
                  } else
                    User.removeTask(widget.task.description, widget.tab);

                  IOManager.saveCompletedTasks();
                  widget.state.setState(() {});
                },
                child: new Container(
                    child: new Container(
                  padding: new EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: widget.task.done
                          ? Colors.blue
                          : User.darkKnightMode
                              ? secondaryDarkTheme
                              : Colors.white,
                      image: widget.task.done
                          ? null
                          : User.darkKnightMode
                              ? null
                              : new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new AssetImage('res/fond.png'))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// Emoji text
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /// Task image
                          widget.task.hasImage
                              ? new Flexible(child: widget.task.image)
                              : new Container(),
                          // Share button
                          widget.task.done
                              ? new InkWell(
                                  onTap: () => Share.share('I just caught a ' +
                                      widget.task.description +
                                      ' on Animal Crossing: New Horizons ! #ACCompletionist'),
                                  child: new Container(
                                    margin: new EdgeInsets.only(right: 30.0),
                                    child: new Icon(Icons.share,
                                        color: User.darkKnightMode
                                            ? textDarkTheme
                                            : Colors.white,
                                        size: 22.0),
                                  ))
                              : new Container()
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(bottom: 16.0)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /// Task description
                          new Flexible(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: new Text(widget.task.description,
                                          style: new TextStyle(
                                              color: widget.task.done
                                                  ? Colors.white
                                                  : User.darkKnightMode
                                                      ? textDarkTheme
                                                      : Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                widget.tab != 4
                                    ? Row(
                                        children: <Widget>[
                                          new Text(widget.task.price,
                                              style: new TextStyle(
                                                color: widget.task.done
                                                    ? Colors.white
                                                    : User.darkKnightMode
                                                        ? textDarkTheme
                                                        : Colors.black,
                                              )),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          widget.task.hasImage
                              ? widget.tab == 4
                                  ? Container()
                                  : new FlatButton(
                                      onPressed: () =>
                                          showRatedDialog(context, widget.tab),
                                      child: Icon(Icons.info))
                              : Container(),
                        ],
                      )
                    ],
                  ),
                )),
              ),
            )),
      ),
    );
  }

  dynamic showArtsDiff(BuildContext buildContext, int tab) {
    showDialog(
      context: buildContext,
      child: new AlertDialog(
        titlePadding: new EdgeInsets.all(0.0),
        title: new Container(
          color: User.darkKnightMode ? menuDarkTheme : Colors.white,
          padding: new EdgeInsets.symmetric(vertical: 32.0),
          child: new Center(
            child: widget.task.image,
          ),
        ),
        content: Text("hello"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(buildContext).pop();
            },
            child: new Text('CLOSE'),
          ),
        ],
      ),
    );
  }

  dynamic showRatedDialog(BuildContext buildContext, int tab) {
    showDialog(
        context: buildContext,
        child: new AlertDialog(
          titlePadding: new EdgeInsets.all(0.0),
          title: new Container(
            color: User.darkKnightMode ? menuDarkTheme : Colors.white,
            padding: new EdgeInsets.symmetric(vertical: 32.0),
            child: new Center(
              child: widget.task.image,
            ),
          ),
          content: new RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                tab == 3
                    ? TextSpan()
                    : TextSpan(
                        text: 'On which season ?\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                tab == 3 ? TextSpan() : TextSpan(text: widget.task.season),
                tab == 3
                    ? TextSpan()
                    : TextSpan(
                        text: '\n\nWhere to get it ?\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                tab == 3 ? TextSpan() : TextSpan(text: widget.task.location),
                tab == 3
                    ? TextSpan()
                    : TextSpan(
                        text: '\n\nAt which hours ?\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                tab == 3 ? TextSpan() : TextSpan(text: widget.task.time),
                TextSpan(
                    text: '\n\nHow much Bells can I sell it for ?\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: widget.task.price),
                tab == 3
                    ? TextSpan()
                    : TextSpan(
                        text: '\n\nCan I catch it right now ?\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                tab == 3 ? TextSpan() : calculateAvailable()
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(buildContext).pop();
              },
              child: new Text('CLOSE'),
            )
          ],
        ));
  }

  TextSpan calculateAvailable() {
    List list = [];

    if (widget.task.jan) {
      list.add(1);
    }
    if (widget.task.fev) {
      list.add(2);
    }
    if (widget.task.mar) {
      list.add(3);
    }
    if (widget.task.apr) {
      list.add(4);
    }
    if (widget.task.may) {
      list.add(5);
    }
    if (widget.task.jun) {
      list.add(6);
    }
    if (widget.task.jul) {
      list.add(7);
    }
    if (widget.task.aug) {
      list.add(8);
    }
    if (widget.task.sep) {
      list.add(9);
    }
    if (widget.task.oct) {
      list.add(10);
    }
    if (widget.task.nov) {
      list.add(11);
    }
    if (widget.task.dec) {
      list.add(12);
    }

    var now = new DateTime.now();
    final res = list.contains(now.month);
    var month = DateFormat.MMMM().format(now);

    if (res) {
      return TextSpan(
          text: "Available in $month", style: TextStyle(color: Colors.green));
    } else {
      return TextSpan(
          text: "Not available in $month", style: TextStyle(color: Colors.red));
    }
  }
}
