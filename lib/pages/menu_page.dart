import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/misc/custom_icons.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/month_bug.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/month_fish.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/tasks_section.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'onboard_page.dart';
import '../misc/io_manager.dart';
import '../misc/tasks_list.dart';
import 'package:share/share.dart';

class MenuPage extends StatefulWidget {
  State todoListPageState;
  MenuPage(this.todoListPageState);

  @override
  _MenuPageState createState() => new _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Upper part
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Profile infos
            new SizedBox.fromSize(
              size: new Size.fromHeight(190.0),
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  /// Upper gradient
                  new SizedBox.expand(
                    child: new Container(
                      decoration: new BoxDecoration(
                          gradient: new LinearGradient(colors: [
                        new Color(0xFF0acffe),
                        new Color(0xFF495aff)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    ),
                  ),

                  /// Black transparent overlay
                  new SizedBox.expand(
                    child: new Container(
                      color: Colors.black38,
                    ),
                  ),

                  /// Name, tasks num and share button
                  new Align(
                      alignment: Alignment.bottomLeft,
                      child: new Container(
                          margin: new EdgeInsets.all(24.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(User.name,
                                      style: new TextStyle(
                                          color: User.darkKnightMode
                                              ? textDarkTheme
                                              : Colors.white,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.w500)),
                                  new Text(
                                      User.completedTasks.length.toString() +
                                          ' completed tasks out of ' +
                                          (TasksList.tasks.length +
                                                  TasksList.taskde.length +
                                                  TasksList.tasktr.length)
                                              .toString(),
                                      style: new TextStyle(
                                          color: User.darkKnightMode
                                              ? textDarkTheme
                                              : Colors.white)),
                                  new Text(
                                      User.completedFish.length.toString() +
                                          ' completed fishes out of ' +
                                          TasksList.tasks.length.toString(),
                                      style: new TextStyle(color: Colors.blue)),
                                  new Text(
                                      User.completedBugs.length.toString() +
                                          ' completed bugs out of ' +
                                          TasksList.taskde.length.toString(),
                                      style:
                                          new TextStyle(color: Colors.green)),
                                  new Text(
                                      User.completedFossils.length.toString() +
                                          ' completed fossils out of ' +
                                          TasksList.tasktr.length.toString(),
                                      style:
                                          new TextStyle(color: Colors.yellow)),
                                ],
                              ),
                            ],
                          )))
                ],
              ),
            ),

            /// Menu buttons
            new Padding(padding: new EdgeInsets.only(top: 16.0)),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (_) => new FishMonth(widget.todoListPageState)));
              },
              child: new ListTile(
                title: new Text("Fishes of the month",
                    style: new TextStyle(
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                leading: new Icon(Custom.fish,
                    color: User.darkKnightMode ? textDarkTheme : Colors.black),
              ),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (_) => new BugMonth(widget.todoListPageState)));
              },
              child: new ListTile(
                title: new Text("Bugs of the month",
                    style: new TextStyle(
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                leading: new Icon(Custom.ladybug,
                    color: User.darkKnightMode ? textDarkTheme : Colors.black),
              ),
            ),
            new FlatButton(
              onPressed: () async {
                final val = User.prefs.getBool('darkNightMode');
                User.prefs.setBool('darkNightMode', !val);
                await User.prefs.commit();

                setState(() => User.darkKnightMode = !User.darkKnightMode);
                Navigator.of(context).popAndPushNamed('/');
              },
              child: new ListTile(
                title: new Text("Dark Night Mode",
                    style: new TextStyle(
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                leading: new Icon(Icons.lightbulb_outline,
                    color: User.darkKnightMode ? textDarkTheme : Colors.black),
              ),
            ),
            new FlatButton(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationLegalese:
                        'Made by Enzo CONTY\n\nGithub:\nhttps://github.com/BLKKKBVSIK\n\nWebsite:\nhttps://enzoconty.dev/',
                    applicationVersion: 'Alpha: v0.0.1',
                    applicationIcon:
                        new Image.asset('res/icon.png', width: 20.0));
              },
              child: new ListTile(
                title: new Text("About",
                    style: new TextStyle(
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                leading: new Icon(Icons.info,
                    color: User.darkKnightMode ? textDarkTheme : Colors.black),
              ),
            ),
            new FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      titlePadding: new EdgeInsets.all(0.0),
                      title: new Container(
                        padding: new EdgeInsets.symmetric(vertical: 32.0),
                        child: new Center(
                          child: Text(
                            "Wanna contribute ?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      content: new RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Help me find the rest of the data !\n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'Then send me an email:\n'),
                              TextSpan(text: 'contact@enzoconty.dev\n\n\n\n\n'),
                              TextSpan(text: 'Thank you so much ! \u{1F496}'),
                            ]),
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: new Text('CLOSE'),
                        )
                      ],
                    ));
              },
              child: new ListTile(
                title: new Text("Contribute",
                    style: new TextStyle(
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0)),
                leading: new Icon(Icons.assessment,
                    color: User.darkKnightMode ? textDarkTheme : Colors.black),
              ),
            )
          ],
        ),
        // Logout button
        new Container(
            margin: new EdgeInsets.only(bottom: 32.0, left: 32.0, right: 32.0),
            child: new RaisedButton(
                color: Colors.red,
                onPressed: () => showExitDialog(context),
                child: new ListTile(
                  title: new Text("RESET THE APP",
                      style: new TextStyle(color: Colors.white)),
                  trailing: new Icon(Icons.exit_to_app, color: Colors.white),
                )))
      ],
    );
  }

  dynamic showExitDialog(BuildContext buildContext) {
    showDialog(
        context: buildContext,
        child: new AlertDialog(
          titlePadding: new EdgeInsets.all(15.0),
          title: new Text("Are you sure ?"),
          content: new Text('All your progress will be deleted.'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(buildContext).pop();
              },
              child: new Text('CLOSE'),
            ),
            new FlatButton(
              onPressed: () async {
                User.prefs.setString('userName', null);
                User.prefs.setString('userImage', null);
                await User.prefs.commit();
                IOManager.saveCompletedTasks();
                IOManager.deleteAllSave();
                User.completedTasks = new List();
                User.completedFish = new List();
                User.completedBugs = new List();
                User.completedFossils = new List();

                Navigator.of(buildContext).pop();
                Navigator.of(buildContext).pushReplacement(
                    new MaterialPageRoute(builder: (_) => new OnboardPage()));
              },
              child: new Text('CONTINUE'),
            )
          ],
        ));
  }
}
