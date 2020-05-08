import 'package:animal_crossing_completion/misc/io_manager.dart';
import 'package:animal_crossing_completion/misc/tasks_list.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/todo_list_page.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

bool card1 = false;
bool card2 = false;

class BoardTutorial extends StatefulWidget {
  static const routeName = "/tutorialBoard";

  @override
  _BoardTutorialState createState() => _BoardTutorialState();
}

class _BoardTutorialState extends State<BoardTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: new EdgeInsets.only(top: 24.0),
        decoration: BoxDecoration(
            color: Colors.brown,
            image: DecorationImage(
                fit: BoxFit.cover, image: new AssetImage('res/fond.png'))),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
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
                    margin:
                        new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        /// Task description
                                        new Flexible(
                                          child: new Text(
                                              TasksList.tuto[0].description
                                                      .endsWith('.')
                                                  ? TasksList.tuto[0].description
                                                  : TasksList.tuto[0].description +
                                                      '.',
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
                                                  TasksList.tasks[0].description,
                                                  0);

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
                    margin:
                        new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        /// Task description
                                        new Flexible(
                                          child: new Text(
                                              TasksList.tuto[1].description
                                                      .endsWith('.')
                                                  ? TasksList.tuto[1].description
                                                  : TasksList.tuto[1].description +
                                                      '.',
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
                                                  TasksList.tasks[1].description,
                                                  0);

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
                      ? Padding(
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
                                          onPressed: () => Navigator.of(context)
                                              .pushReplacement(
                                                  new MaterialPageRoute(
                                                      builder: (_) =>
                                                          new TodoListPage())),
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
                        )
                      : new Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
