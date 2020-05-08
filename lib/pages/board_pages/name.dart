import 'package:animal_crossing_completion/pages/board_pages/hemisphere.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

bool validName = false;

class NameInput extends StatefulWidget {
  static const routeName = "/nameInput";

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController controller = TextEditingController();

  changesOnField() {
    setState(() {}); // Will re-Trigger Build Method
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(changesOnField);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: new AssetImage('res/fond.png')),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
                          child: new Stack(children: <Widget>[
                new ListView(
                  children: <Widget>[
                    /// Logo
                    new Align(
                        alignment: FractionalOffset.topCenter,
                        child: new Container(
                            margin: new EdgeInsets.only(
                                left: 32.0, top: 48.0, right: 16.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Text('AC Completionist: New Horizon',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 38.0,
                                        color: Colors.black)),
                                new Padding(
                                    padding: new EdgeInsets.only(bottom: 4.0)),
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
                        new Text("3 characters minimum."),
                        new Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          margin: new EdgeInsets.symmetric(
                              horizontal: 66.0, vertical: 24.0),
                          child: new TextField(
                            controller: controller,
                            maxLength: 10,
                            decoration: new InputDecoration.collapsed(
                                hintText: 'What\'s your name?'),
                            onChanged: verifValidityName(controller.text),
                            style: new TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: Align(
                                    alignment: FractionalOffset.bottomRight,
                                    child: new Container(
                                        margin: new EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 24.0),
                                        child: new RaisedButton(
                                          onPressed: () =>
                                              controller.text.length >= 3 &&
                                                      controller.text.length <= 10
                                                  ? saveName(controller.text)
                                                  : null,
                                          color:
                                              validName ? Colors.black : Colors.grey,
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
                      ],
                    ),
                  ].reversed.toList(),
                  shrinkWrap: true,
                  reverse: true,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  verifValidityName(String inputName) {
    if (inputName.trim().length > 10 || inputName.trim().length < 3) {
      setState(() => validName = false);
      return;
    }
    setState(() => validName = true);
  }

  saveName(String userName) async {
    FocusScope.of(context).unfocus();

    User.prefs.setString('userName', userName.trim());
    await User.prefs.commit();

    setState(() => User.name = userName.trim());

    Navigator.of(context).pushReplacementNamed(BoardHemisphere.routeName);
  }
}
