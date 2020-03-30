import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'tasks_list.dart';
import '../logic/task.dart';
import '../user.dart';

class IOManager
{
  static Future<String> get _localPath async
  {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _getSaveFile async
  {
    final path = await _localPath;
    return new File('$path/completed_tasks.txt');
  }

  static Future<File> get _getSaveFileFish async
  {
    final path = await _localPath;
    return new File('$path/completedfishs_tasks.txt');
  }

  static Future<File> get _getSaveFileBug async
  {
    final path = await _localPath;
    return new File('$path/completedbugs_tasks.txt');
  }

  static Future<File> get _getSaveFileFossil async
  {
    final path = await _localPath;
    return new File('$path/completedfossils_tasks.txt');
  }



  static Future<void> deleteAllSave() async {
    File file = await _getSaveFile;
    file.delete();
    file = await _getSaveFileFish;
    file.delete();
    file = await _getSaveFileBug;
    file.delete();
    file = await _getSaveFileFossil;
    file.delete();
  }

  static Future<void> getCompletedTasks() async
  {
    List<Task> completedTasks = new List();

    try
    {
      File file = await _getSaveFile;
      List<String> contents = await file.readAsLines();

      for (int i = 0; i < contents.length; i++)
      {
        for (int j = 0; j < TasksList.tasks.length; j++)
        {
          if(contents[i] == TasksList.tasks[j].description)
          {
            completedTasks.add(TasksList.tasks[j]);
          }
        }
      }
      User.completedTasks = completedTasks;


      file = await _getSaveFileFish;
      contents = await file.readAsLines();
      completedTasks = new List();

      for (int i = 0; i < contents.length; i++)
      {
        for (int j = 0; j < TasksList.tasks.length; j++)
        {
          if(contents[i] == TasksList.tasks[j].description)
          {
            completedTasks.add(TasksList.tasks[j]);
          }
        }
      }
      User.completedFish = completedTasks;

      

      file = await _getSaveFileBug;
      contents = await file.readAsLines();
      completedTasks = new List();

      for (int i = 0; i < contents.length; i++)
      {
        for (int j = 0; j < TasksList.taskde.length; j++)
        {
          if(contents[i] == TasksList.taskde[j].description)
          {
            completedTasks.add(TasksList.taskde[j]);
          }
        }
      }
      print(completedTasks);
      User.completedBugs = completedTasks;


      file = await _getSaveFileFossil;
      contents = await file.readAsLines();
      completedTasks = new List();

      for (int i = 0; i < contents.length; i++)
      {
        for (int j = 0; j < TasksList.tasktr.length; j++)
        {
          if(contents[i] == TasksList.tasktr[j].description)
          {
            completedTasks.add(TasksList.tasktr[j]);
          }
        }
      }
      User.completedFossils = completedTasks;


    }
    catch (e)
    {
      print(e);
      return completedTasks;
    }
  }

  static void saveCompletedTasks() async
  {
    File file = await _getSaveFile;
    File filefish = await _getSaveFileFish;
    File filebug = await _getSaveFileBug;
    File filefossil = await _getSaveFileFossil;

    String tasksToWrite = '';

    List<Task> tasks = User.completedTasks;

    for (int i = 0; i < tasks.length; i++)
    {
      tasksToWrite += tasks[i].description;
      if(i != tasks.length - 1) tasksToWrite += '\n';
    }

    //print(tasksToWrite);
    file.writeAsString(tasksToWrite, mode: FileMode.writeOnly);

    tasks = User.completedFish;
    tasksToWrite = '';

    for (int i = 0; i < tasks.length; i++)
    {
      tasksToWrite += tasks[i].description;
      if(i != tasks.length - 1) tasksToWrite += '\n';
    }

    filefish.writeAsString(tasksToWrite, mode: FileMode.writeOnly);

    tasks = User.completedBugs;
    tasksToWrite = '';

    for (int i = 0; i < tasks.length; i++)
    {
      tasksToWrite += tasks[i].description;
      if(i != tasks.length - 1) tasksToWrite += '\n';
    }
    filebug.writeAsString(tasksToWrite, mode: FileMode.writeOnly);

    tasks = User.completedFossils;
    tasksToWrite = '';

    for (int i = 0; i < tasks.length; i++)
    {
      tasksToWrite += tasks[i].description;
      if(i != tasks.length - 1) tasksToWrite += '\n';
    }

    filefossil.writeAsString(tasksToWrite, mode: FileMode.writeOnly);
  }
}