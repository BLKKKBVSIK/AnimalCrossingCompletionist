import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/tasks_section.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BugMonth extends StatefulWidget {
  State state;

  BugMonth(this.state);

  @override
  _BugMonthState createState() => _BugMonthState();
}

class _BugMonthState extends State<BugMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: User.darkKnightMode ? veryDarkTheme : acTheme,
      title: Text(getMonthTitle()),),
            body: Container(
              child: new Builder(
                builder: (BuildContext context) {
                  return new CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: <Widget>[
                      new SliverList(
                          delegate: new SliverChildListDelegate(<Widget>[
                          DecoratedBox(
                          decoration: BoxDecoration(color: User.darkKnightMode ? menuDarkTheme : acTheme),
                          child: new SizedBox(height: 20,)),
                        new BuilderTaskType(this, 5),
                        DecoratedBox(
                          decoration: BoxDecoration(color: User.darkKnightMode ? menuDarkTheme : acTheme),
                          child: new SizedBox(height: 60,))
                      ]))
                    ],
                  );
                },
              ),
            ),);
      
        }
      
        String getMonthTitle() {
            var now = new DateTime.now();
            final monthName = DateFormat.MMMM().format(now);

            return monthName;
        }
}