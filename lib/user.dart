import 'logic/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static String name;
  static List<Task> completedTasks = new List();
  static List<Task> completedFish = new List();
  static List<Task> completedBugs = new List();
  static List<Task> completedFossils = new List();
  static bool darkKnightMode;

  static SharedPreferences prefs;

  static void removeTask(String taskDesc, int tab) {
    for (int i = 0; i < completedTasks.length; i++) {
      if (completedTasks[i].description == taskDesc) completedTasks.removeAt(i);
    }

    if (tab == 0) {
      return null;
    } else if (tab == 1) {
      for (int i = 0; i < completedFish.length; i++) {
        if (completedFish[i].description == taskDesc)
          completedFish.removeAt(i);
      }
    } else if (tab == 2) {
      for (int i = 0; i < completedBugs.length; i++) {
        if (completedBugs[i].description == taskDesc)
          completedBugs.removeAt(i);
      }
    } else if (tab == 3) {
      for (int i = 0; i < completedFossils.length; i++) {
        if (completedFossils[i].description == taskDesc)
          completedFossils.removeAt(i);
      }
    }
  }
}
