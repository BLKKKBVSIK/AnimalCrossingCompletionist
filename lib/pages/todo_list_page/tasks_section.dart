import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../logic/task.dart';
import '../../misc/tasks_list.dart';
import '../../user.dart';
import 'todo_card.dart';


class BuilderTaskType extends StatefulWidget {

  State state;
  int position;
  
  BuilderTaskType(this.state, this.position);

  @override
  _BuilderTaskTypeState createState() => _BuilderTaskTypeState();
}

class _BuilderTaskTypeState extends State<BuilderTaskType> {
  @override
  Widget build(BuildContext context) {
    //print(widget.position);
    return new Column
    (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: returnRightList(widget.position)
          );
        }
      
    List<Widget> returnRightList(int position) {
      switch (position) {
        case 0: {
          return TasksList.tasks.map<Widget>((Task task) => new TodoCard(checkIfDone(task, User.completedFish), widget.state, 1)).toList();
        } break;
        case 1: {
          return TasksList.taskde.map<Widget>((Task task) => new TodoCard(checkIfDone(task, User.completedBugs), widget.state, 2)).toList();
        } break;
        case 2: {
          return TasksList.tasktr.map<Widget>((Task task) => new TodoCard(checkIfDone(task, User.completedFossils), widget.state, 3)).toList();
        } break;
        case 4: {
          return TasksList.tasks.where((task) { 
            var now = new DateTime.now();
            final monthName = DateFormat.MMMM().format(now);

            var returnValue = false;
            if (task.jan == true && monthName == 'January') {
              returnValue = true;
            } else if (task.fev == true && monthName == 'February') {
              returnValue = true;
            } else if (task.mar == true && monthName == 'March') {
              returnValue = true;
            } else if (task.apr == true && monthName == 'April') {
              returnValue = true;
            } else if (task.may == true && monthName == 'May') {
              returnValue = true;
            } else if (task.jun == true && monthName == 'June') {
              returnValue = true;
            } else if (task.jul == true && monthName == 'July') {
              returnValue = true;
            } else if (task.aug == true && monthName == 'August') {
              returnValue = true;
            } else if (task.sep == true && monthName == 'September') {
              returnValue = true;
            } else if (task.oct == true && monthName == 'October') {
              returnValue = true;
            } else if (task.nov == true && monthName == 'November') {
              returnValue = true;
            } else if (task.dec == true && monthName == 'December') {
              returnValue = true;
            }
              
            return returnValue;
              }
          ).map<Widget>((Task task) => new TodoCard(checkIfDone(task, User.completedFish), widget.state, 1)).toList();
        }
        case 5: {
          return TasksList.taskde.where((task) { 
            var now = new DateTime.now();
            final monthName = DateFormat.MMMM().format(now);

            var returnValue = false;
            if (task.jan == true && monthName == 'January') {
              returnValue = true;
            } else if (task.fev == true && monthName == 'February') {
              returnValue = true;
            } else if (task.mar == true && monthName == 'March') {
              returnValue = true;
            } else if (task.apr == true && monthName == 'April') {
              returnValue = true;
            } else if (task.may == true && monthName == 'May') {
              returnValue = true;
            } else if (task.jun == true && monthName == 'June') {
              returnValue = true;
            } else if (task.jul == true && monthName == 'July') {
              returnValue = true;
            } else if (task.aug == true && monthName == 'August') {
              returnValue = true;
            } else if (task.sep == true && monthName == 'September') {
              returnValue = true;
            } else if (task.oct == true && monthName == 'October') {
              returnValue = true;
            } else if (task.nov == true && monthName == 'November') {
              returnValue = true;
            } else if (task.dec == true && monthName == 'December') {
              returnValue = true;
            }
              
            return returnValue;
              }
          ).map<Widget>((Task task) => new TodoCard(checkIfDone(task, User.completedBugs), widget.state, 2)).toList();
        } break;
      }
    }

    Task checkIfDone(Task task, List<Task> checkList)
  {
    for (var i = 0; i < checkList.length; i++)
    {
      if(checkList[i].description == task.description)
      {
        task.done = true;
        break;
      }
    }

    return task;
  }
}
