import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:flutter/material.dart';
import '../../misc/tasks_list.dart';
import 'todo_list_page.dart';
import '../../user.dart';

class ProgressBar extends StatefulWidget
{
  final TodoListPage listPage;
  ProgressBar(this.listPage);

  @override
  _ProgressBarState createState() => new _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
{
  @override
  void dispose()
  {
    widget.listPage.showSmallProgressBar = true;
    widget.listPage.resetState = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    widget.listPage.showSmallProgressBar = false;
    widget.listPage.resetState = true;
    
    return new Container
    (
      color: User.darkKnightMode ? veryDarkTheme : Color.fromRGBO(78, 196, 119, 1),
      padding: new EdgeInsets.only(left: 18.0, right: 18.0, bottom: 20.0),
      child: new Column
      (
        children: <Widget>
        [
          new Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>
            [
              new Text('PROGRESS', style: new TextStyle(fontWeight: FontWeight.w500, color: User.darkKnightMode ? textDarkTheme : Colors.black)),
              new Row
              (
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>
                [
                  new Text((User.completedFish.length + User.completedBugs.length + User.completedFossils.length).toString(), style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.w700)),
                  new Text('/', style: TextStyle(color: User.darkKnightMode ? textDarkTheme : Colors.black),),
                  new Text(calculateListsLenght(), style: new TextStyle(fontWeight: FontWeight.w500, color: User.darkKnightMode ? textDarkTheme : Colors.black)),
                                  ],
                                )
                              ],
                            ),
                            new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                            new Stack
                            (
                              alignment: FractionalOffset.centerLeft,
                              children: <Widget>
                              [
                                new SizedBox.fromSize
                                (
                                  size: new Size.fromHeight(10.0),
                                  child: new Material
                                  (
                                    color: Colors.white,
                                  ),
                                ),
                                new SizedBox.fromSize
                                (
                                  size: new Size(((User.completedFish.length + User.completedBugs.length + User.completedFossils.length + 1) / (TasksList.taskde.length + TasksList.tasks.length + TasksList.tasktr.length)) * MediaQuery.of(context).size.width - 
                                  (((User.completedTasks.length / (TasksList.taskde.length + TasksList.tasks.length + TasksList.tasktr.length)) * MediaQuery.of(context).size.width) * 0.7), 10.0),
                                  child: new Material
                                  (
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  
                    String calculateListsLenght() {
                      final res = TasksList.tasks.length + TasksList.taskde.length + TasksList.tasktr.length;
                      return res.toString();
                    }
}