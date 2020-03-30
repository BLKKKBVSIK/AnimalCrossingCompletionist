import 'package:flutter/material.dart';

import 'todo_list_page/todo_list_page.dart';
import '../misc/tasks_list.dart';
import '../user.dart';
import 'dart:io';
import '../misc/io_manager.dart';

bool card1 = false;
bool card2 = false;

class OnboardPage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _OnboardPageState createState() => new _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  AssetImage bgImage;
  File profileImageFile;
  PageController pageController = new PageController();
  TextEditingController controller = new TextEditingController();
  LinearGradient transparentToWhite = new LinearGradient(
      colors: [Colors.red, Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  @override
  void initState() {
    super.initState();
    //bgImage = new AssetImage('res/forest.jpg');
    //bgImage.resolve(ImageConfiguration.empty);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              onboardPage(
                  'Keep track of fish, bugs and fossils of Animal Crossing: New Horizon.'),
              nameAndImagePage(),
              tutorialPage()
            ]));
  }

  Widget onboardPage(String text) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          child: Image.asset('res/fishtuto.png'),
        ),
        new Flexible(
            flex: 1,
            child: new Container(
                margin: new EdgeInsets.all(32.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(text,
                        style: new TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(''),
                        new Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: new IconButton(
                              onPressed: () => pageController.nextPage(
                                  duration: new Duration(milliseconds: 500),
                                  curve: Curves.easeInOut),
                              icon: new Icon(Icons.arrow_forward,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )))
      ],
    );
  }

  Widget nameAndImagePage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage('res/activities_zoom.png')),
      ),
      child: new Stack(children: <Widget>[
        new ListView(
          children: <Widget>[
            /// Logo
            new Align(
                alignment: FractionalOffset.topCenter,
                child: new Container(
                    margin:
                        new EdgeInsets.only(left: 32.0, top: 48.0, right: 16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Text('AC Completionist: New Horizon',
                            style: new TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 38.0,
                                color: Colors.white)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                      ],
                    ))),

            /// Image and name card
            new Padding(padding: new EdgeInsets.only(bottom: 32.0)),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: new EdgeInsets.symmetric(
                      horizontal: 66.0, vertical: 24.0),
                  child: new TextField(
                    controller: controller,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'What\'s your name?'),
                    onChanged: (_) => setState(() {}),
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                )
              ],
            ),

            /// Continue button
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                  margin: new EdgeInsets.only(top: 48.0),
                  child: new Material(
                    elevation: controller.text.length >= 4 &&
                            controller.text.length <= 10
                        ? 4.0
                        : 0.0,
                    child: new Container(
                      decoration: controller.text.length >= 4 &&
                              controller.text.length <= 10
                          ? new BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    new Color(0xFF0acffe),
                                    new Color(0xFF495aff)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            )
                          : new BoxDecoration(color: Colors.grey),
                      child: new Material(
                        color: Colors.transparent,
                        child: new InkWell(
                            onTap: () => controller.text.length >= 4 &&
                                    controller.text.length <= 10
                                ? saveName(controller.text)
                                : null,
                            child: new Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 90.0, vertical: 16.0),
                              child: new Text('CONTINUE',
                                  style: new TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            )),
                      ),
                    ),
                  )),
            ),
          ].reversed.toList(),
          shrinkWrap: true,
          reverse: true,
        ),
      ]),
    );
  }

  Widget tutorialPage() {
    return new Container(
      margin: new EdgeInsets.only(top: 24.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 24.0, right: 2.0, top: 16.0),
            child: new Text('Hey ${User.name},',
                style: new TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            child: new Text('nice to meet you!',
                style: new TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 24.0, right: 24.0, bottom: 48.0),
            child: new Text(
                'To complete tasks, click the checkbox, or click anywhere on the card. It should become blue.',
                style: new TextStyle(fontSize: 18.0)),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
            child: new Material(
                elevation: 5.0,
                color: card1 ? Colors.blue : Colors.white,
                child: new Material(
                  color: Colors.transparent,
                  child: new InkWell(
                      onTap: () {
                        setState(() => card1 = !card1);

                        if (card1)
                          User.completedTasks.add(TasksList.tuto[0]);
                        else
                          User.removeTask(TasksList.tuto[0].description, 0);

                        IOManager.saveCompletedTasks();
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                                padding: new EdgeInsets.only(bottom: 16.0)),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /// Task description
                                new Flexible(
                                  child: new Text(
                                      TasksList.tuto[0].description
                                              .endsWith('.')
                                          ? TasksList.tuto[0].description
                                          : TasksList.tuto[0].description + '.',
                                      style: new TextStyle(
                                          color: card1
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                                new Checkbox(
                                  onChanged: (bool newState) {
                                    setState(() => card1 = newState);

                                    if (newState)
                                      User.completedTasks
                                          .add(TasksList.tasks[0]);
                                    else
                                      User.removeTask(
                                          TasksList.tasks[0].description, 0);

                                    IOManager.saveCompletedTasks();
                                  },
                                  activeColor: Colors.blue,
                                  value: card1,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                )),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
            child: new Material(
                elevation: 5.0,
                color: card2 ? Colors.blue : Colors.white,
                child: new Material(
                  color: Colors.transparent,
                  child: new InkWell(
                      onTap: () {
                        setState(() => card2 = !card2);

                        if (card2)
                          User.completedTasks.add(TasksList.tuto[1]);
                        else
                          User.removeTask(TasksList.tuto[1].description, 0);

                        IOManager.saveCompletedTasks();
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                                padding: new EdgeInsets.only(bottom: 16.0)),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /// Task description
                                new Flexible(
                                  child: new Text(
                                      TasksList.tuto[1].description
                                              .endsWith('.')
                                          ? TasksList.tuto[1].description
                                          : TasksList.tuto[1].description + '.',
                                      style: new TextStyle(
                                          color: card2
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                                new Checkbox(
                                  onChanged: (bool newState) {
                                    setState(() => card2 = newState);

                                    if (newState)
                                      User.completedTasks
                                          .add(TasksList.tasks[1]);
                                    else
                                      User.removeTask(
                                          TasksList.tasks[1].description, 0);

                                    IOManager.saveCompletedTasks();
                                  },
                                  activeColor: Colors.blue,
                                  value: card2,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                )),
          ),
          card1 && card2
              ? new Container(
                  margin:
                      new EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
                  child: new RaisedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                            builder: (_) => new TodoListPage())),
                    color: Colors.black,
                    child: new ListTile(
                      title: new Text('Let\'s start',
                          style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      trailing:
                          new Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ))
              : new Container()
        ],
      ),
    );
  }

  saveName(String userName) async {
    if (userName.trim().length > 10 || userName.trim().length < 4) {
      return;
    }

    User.prefs.setString('userName', userName.trim());
    await User.prefs.commit();

    setState(() => User.name = userName.trim());

    pageController.nextPage(
        duration: new Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
