import 'package:animal_crossing_completion/logic/task.dart';
import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/misc/custom_icons.dart';
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
      _buildTabs(Colors.blue, TasksList.tasks, "fishs"),
      _buildTabs(Colors.green, TasksList.taskde, "bugs"),
      _buildTabs(Colors.yellow, TasksList.tasktr, "fossils"),
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
          )
        ],
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

  Widget _buildTabs(
      Color smallProgressBarColor, List<Task> tasksList, String type) {
    return Container(
      child: new Builder(
        builder: (BuildContext context) {
          return new CustomScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              new SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 5.0,
                floating: false,
                pinned: true,
                centerTitle: false,
                backgroundColor: User.darkKnightMode
                    ? veryDarkTheme
                    : Color.fromRGBO(78, 196, 119, 1),
                titleSpacing: 0.0,
                actions: <Widget>[
                  RaisedButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    child: Icon(
                      Icons.menu,
                      color: User.darkKnightMode ? textDarkTheme : Colors.black,
                    ),
                    color: User.darkKnightMode
                        ? veryDarkTheme
                        : Colors.transparent,
                    elevation: 0,
                  )
                ],
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Flexible(
                    child: new Text('ACCompletionist',
                        style: new TextStyle(
                            fontFamily: "Fink",
                            color: User.darkKnightMode
                                ? textDarkTheme
                                : Colors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                expandedHeight: 110.0,
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[new ProgressBar(widget)],
                  ),
                ),
              ),
              new SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                new Container(
                    margin: new EdgeInsets.only(
                        right: 18.0, bottom: 8.0, top: 16.0),
                    child: new Text('${type} list',
                        textAlign: TextAlign.end,
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: User.darkKnightMode
                              ? textDarkTheme
                              : Colors.black,
                        ))),
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
