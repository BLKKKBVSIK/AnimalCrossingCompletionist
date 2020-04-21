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
  String dropdownValue = getMonthTitle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: User.darkKnightMode ? veryDarkTheme : acTheme,
        title: DropdownButton<String>(
          value: dropdownValue,
          items: <String>[
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
        ),
      ),
      body: Container(
        child: new Builder(
          builder: (BuildContext context) {
            return new CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                new SliverList(
                    delegate: new SliverChildListDelegate(<Widget>[
                  DecoratedBox(
                      decoration: BoxDecoration(
                          color: User.darkKnightMode ? menuDarkTheme : acTheme),
                      child: new SizedBox(
                        height: 20,
                      )),
                  new BuilderTaskType(this, 5, dropdownValue),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          color: User.darkKnightMode ? menuDarkTheme : acTheme),
                      child: new SizedBox(
                        height: 60,
                      ))
                ]))
              ],
            );
          },
        ),
      ),
    );
  }

  static String getMonthTitle() {
    var now = new DateTime.now();
    final monthName = DateFormat.MMMM().format(now);

    return monthName;
  }
}
