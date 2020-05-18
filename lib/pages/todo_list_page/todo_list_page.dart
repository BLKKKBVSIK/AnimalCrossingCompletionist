import 'package:animal_crossing_completion/logic/task.dart';
import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/misc/custom_icons.dart';
import 'package:animal_crossing_completion/pages/todo_list_page/todo_card.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../../misc/io_manager.dart';
import '../../misc/tasks_list.dart';
import '../../user.dart';
import 'progress_bar.dart';
import 'tasks_section.dart';
import '../menu_page.dart';

class TodoListPage extends StatefulWidget {
  bool showSmallProgressBar = false;
  bool resetState = false;
  static const String routeName = '/todolist';

  @override
  TodoListPageState createState() => new TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {
  SnakeShape customSnakeShape = SnakeShape(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      centered: true);
  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );

  int _selectedItemPosition = 1;
  SnakeBarStyle snakeBarStyle = SnakeBarStyle.floating;
  SnakeShape snakeShape = SnakeShape.circle;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));
  double elevation = 0;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  ScrollController controller = new ScrollController();

  @override
  void initState() {
    super.initState();

    IOManager.getCompletedTasks().then((_) => setState(() {}));

    controller.addListener(() {
      if (controller.offset == 0.0)
        setState(() {
          widget.showSmallProgressBar = false;
        });

      // The ProgressBar has been updated
      if (widget.resetState) {
        setState(() {});
        widget.resetState = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> navBar = [
      /* *************************
      *  FISHING SECTION         *
      ************************** */
      _buildTabs(Colors.blue, TasksList.tasks, "fishes"),
      _buildTabs(Colors.green, TasksList.taskde, "bugs"),
      _buildTabs(Colors.yellow, TasksList.tasktr, "fossils"),
      _buildTabs(Colors.grey, TasksList.taskArt, "Art"),
      /* ************************
    *       Bug section
    *
    *************************** */

      /* ******************
    *       Fossils
    *
    ********************** */
    ];
    return new Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: User.darkKnightMode ? menuDarkTheme : acTheme,
      bottomNavigationBar: SnakeNavigationBar(
        style: snakeBarStyle,
        snakeShape: snakeShape,
        snakeColor: acTheme, //comment if you want to see colors
        backgroundColor: User.darkKnightMode
            ? veryDarkTheme
            : Colors.brown, //comment if you want to see colors
//        snakeGradient:
//            selectionGradient, //uncomment if you want to see gradients
//        backgroundGradient:
//            backgroundGradient, //uncomment if you want to see gradients
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        selectedItemColor: Colors.white,
//        selectedItemGradient: LinearGradient(colors: [Colors.red,Colors.amber]),
        shape: bottomBarShape,
        padding: EdgeInsets.all(5),
        currentIndex: _selectedItemPosition,
        onPositionChanged: (index) =>
            setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Custom.fish)),
          BottomNavigationBarItem(
            icon: Icon(Custom.ladybug),
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom.fossil),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.aspect_ratio)),
        ],
      ),
      appBar: AppBar(
        backgroundColor: User.darkKnightMode ? veryDarkTheme : menuAcTheme,
        title: Text('ACCompletionist',
            style: new TextStyle(
                fontFamily: "Fink",
                color: User.darkKnightMode ? textDarkTheme : Colors.black,
                fontSize: 36.0,
                fontWeight: FontWeight.w400)),
      ),
      body: Stack(
        children: <Widget>[
          navBar[_selectedItemPosition],
        ],
      ),
      drawer: new Drawer(
          child: Container(
        child: new MenuPage(this),
        color: User.darkKnightMode ? menuDarkTheme : Colors.white,
      )),
    );
  }

  /* Future<List<Task>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return TasksList.tasks.where((item) {return item.description.contains(search);});
  } */

  Widget _buildTabs(
      Color smallProgressBarColor, List<Task> tasksList, String type) {
    return Container(
      child: new Builder(
        builder: (BuildContext context) {
          return new CustomScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              new SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                SizedBox(
                  height: AppBar().preferredSize.height + 40,
                ),
                ProgressBar(widget),
                /* Container(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchBar(
                      onSearch: search,
                      onItemFound: (Task task, int index) {
                        return ListTile(
                          title: Text(task.description),
                          subtitle: Text(task.price),
                        );
                      },
                    ),
                  ),
                ), */
                new BuilderTaskType(this, _selectedItemPosition),
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
    );
  }
}
