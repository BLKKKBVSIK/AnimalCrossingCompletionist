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
                  'Keep track of fishes, bugs and fossils of Animal Crossing: New Horizon.'),
              nameAndImagePage(),
              hemisphereBoard(
                  "Select in which part of the world you are living."),
              tutorialPage()
            ]));
  }

  Widget onboardPage(String text) {
    return new Column(
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
                    Container(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          new Text(text,
                              style: new TextStyle(
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
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
                                      onPressed: () => pageController.nextPage(
                                          duration:
                                              new Duration(milliseconds: 500),
                                          curve: Curves.easeInOut),
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
    );
  }

  Widget nameAndImagePage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: new AssetImage('res/fond.png')),
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
                                color: Colors.black)),
                        new Padding(padding: new EdgeInsets.only(bottom: 4.0)),
                      ],
                    ))),

            /// Image and name card
            new Padding(padding: new EdgeInsets.only(bottom: 32.0)),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
          ].reversed.toList(),
          shrinkWrap: true,
          reverse: true,
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
                          onPressed: () => controller.text.length >= 4 &&
                                  controller.text.length <= 10
                              ? saveName(controller.text)
                              : null,
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
      ]),
    );
  }

  Widget hemisphereBoard(String text) {
    return new Container(
      margin: new EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: new AssetImage('res/fond.png')),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('res/hemisphere.jpg'),
          new Container(
            margin: new EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Hello ${User.name}",
                  style: new TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
                new Text("Nice to meet you",
                    style: new TextStyle(fontSize: 24.0)),
                new Text(
                  "\n" + text,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
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
                        setState(() => card2 = false);
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /// Task description
                                new Flexible(
                                  child: new Text("North hemisphere",
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
                                    setState(() => card2 = false);
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
                        setState(() => card1 = false);
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /// Task description
                                new Flexible(
                                  child: new Text("South hemisphere",
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
                                    setState(() => card1 = false);
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
          card1 || card2
              ? Expanded(
                              child: Padding(
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
                                    onPressed: () =>
                                        controller.text.length >= 4 &&
                                                controller.text.length <= 10
                                            ? saveName(controller.text)
                                            : null,
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
                  ),
              )
              : new Container()
        ],
      ),
    );
  }

  Widget tutorialPage() {
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: new AssetImage('res/fond.png')),
      ),
      margin: new EdgeInsets.only(top: 24.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 48.0, top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: new Text('Now a quick tutorial!',
                      style: new TextStyle(
                          fontSize: 34.0, fontWeight: FontWeight.w600)),
                ),
                new Text(
                    'To complete tasks, click the checkbox, or click anywhere on the card. It should become blue.',
                    style: new TextStyle(fontSize: 20.0)),
              ],
            ),
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
              ? Expanded(
                              child: Padding(
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
                                    onPressed: () => Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                            builder: (_) => new TodoListPage())),
                                    color: Colors.black,
                                    child: new ListTile(
                                      title: new Text('Let\'s start',
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
                  ),
              )
              : new Container()
        ],
      ),
    );
  }

  saveName(String userName) async {
    if (userName.trim().length > 10 || userName.trim().length < 4) {
      return;
    }
    FocusScope.of(context).unfocus();

    User.prefs.setString('userName', userName.trim());
    await User.prefs.commit();

    setState(() => User.name = userName.trim());

    pageController.nextPage(
        duration: new Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  saveHemisphere() async {
    if (card1) {
      User.prefs.setBool('hemisphere', true);
      await User.prefs.commit();
      setState(() => User.hemisphere = true);
    } else {
      User.prefs.setBool('hemisphere', false);
      await User.prefs.commit();
      setState(() => User.hemisphere = false);
    }

    pageController.nextPage(
        duration: new Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
