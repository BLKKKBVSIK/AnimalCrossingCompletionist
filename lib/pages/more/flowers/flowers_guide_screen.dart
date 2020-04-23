import 'package:animal_crossing_completion/misc/colors.dart';
import 'package:animal_crossing_completion/user.dart';
import 'package:flutter/material.dart';

class FlowerGuide extends StatelessWidget {
  static const routeName = "/flowers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: User.darkKnightMode ? menuDarkTheme : acTheme,
      appBar: AppBar(
          title: Text(
            "Flowers guide",
            style: TextStyle(fontFamily: "Fink"),
          ),
          backgroundColor: User.darkKnightMode ? veryDarkTheme : menuAcTheme),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Cosmos",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_cosmos-icon", flowerTwo: "NH-red_cosmos-icon", result: "NH-black_cosmos-icon"),
                    _buildFlower(flowerOne: "NH-red_cosmos-icon", flowerTwo: "NH-white_cosmos-icon", result: "NH-pink_cosmos-icon"),
                    _buildFlower(flowerOne: "NH-red_cosmos-icon", flowerTwo: "NH-yellow_cosmos-icon", result: "NH-orange_cosmos-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Roses",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_rose_icon", flowerTwo: "NH-white_rose_icon", result: "NH-pink_rose_icon"),
                    _buildFlower(flowerOne: "NH-red_rose_icon", flowerTwo: "NH-yellow_rose_icon", result: "NH-orange_rose_icon"),
                    _buildFlower(flowerOne: "NH-white_rose_icon", flowerTwo: "NH-white_rose_icon", result: "NH-purple_roses-icon"),
                    _buildFlower(flowerOne: "NH-red_rose_icon", flowerTwo: "NH-red_rose_icon", result: "NH-black_roses-icon"),
                    _buildFlower(flowerOne: "NH-orange_rose_icon", flowerTwo: "NH-orange_rose_icon", result: "NH-blue_roses-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Tulips",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_tulips-icon", flowerTwo: "NH-yellow_tulips-icon", result: "NH-orange_tulips-icon"),
                    _buildFlower(flowerOne: "NH-red_tulips-icon", flowerTwo: "NH-red_tulips-icon", result: "NH-black_tulips-icon"),
                    _buildFlower(flowerOne: "NH-red_tulips-icon", flowerTwo: "NH-white_tulips-icon", result: "NH-pink_tulips-icon"),
                    _buildFlower(flowerOne: "NH-orange_tulips-icon", flowerTwo: "NH-orange_tulips-icon", result: "NH-purple_tulips-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Pansies",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-white_pansy_icon", flowerTwo: "NH-white_pansy_icon", result: "NH-blue_pansy_icon"),
                    _buildFlower(flowerOne: "NH-red_pansy_icon", flowerTwo: "NH-yellow_pansies-icon", result: "NH-orange_pansy_icon"),
                    _buildFlower(flowerOne: "NH-blue_pansy_icon", flowerTwo: "NH-blue_pansy_icon", result: "NH-purple_pansies-icon"),
                    _buildFlower(flowerOne: "NH-red_pansy_icon", flowerTwo: "NH-red_pansy_icon", result: "NH-purple_pansies-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Lilies",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_lily_icon", flowerTwo: "NH-red_lily_icon", result: "NH-black_lilies-icon"),
                    _buildFlower(flowerOne: "NH-red_lily_icon", flowerTwo: "NH-yellow_lily_icon", result: "NH-orange_lily_icon"),
                    _buildFlower(flowerOne: "NH-red_lily_icon", flowerTwo: "NH-white_lily_icon", result: "NH-pink_lilies-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Windflowers",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_windflowers-icon", flowerTwo: "NH-orange_windflowers-icon", result: "NH-pink_windflowers-icon"),
                    _buildFlower(flowerOne: "NH-orange_windflowers-icon", flowerTwo: "NH-white_windflowers-icon", result: "NH-blue_windflowers-icon"),
                    _buildFlower(flowerOne: "NH-white_windflowers-icon", flowerTwo: "NH-white_windflowers-icon", result: "NH-blue_windflowers-icon"),
                    _buildFlower(flowerOne: "NH-blue_windflowers-icon", flowerTwo: "NH-pink_windflowers-icon", result: "NH-purple_windflowers-icon"),
                    _buildFlower(flowerOne: "NH-blue_windflowers-icon", flowerTwo: "NH-blue_windflowers-icon", result: "NH-purple_windflowers-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Hyacinths",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_hyacinth_icon", flowerTwo: "NH-white_hyacinth_icon", result: "NH-pink_hyacinths-icon"),
                    _buildFlower(flowerOne: "NH-white_hyacinth_icon", flowerTwo: "NH-white_hyacinth_icon", result: "NH-blue_hyacinth_icon"),
                    _buildFlower(flowerOne: "NH-red_hyacinth_icon", flowerTwo: "NH-yellow_hyacinths-icon", result: "NH-orange_hyacinth_icon"),
                    _buildFlower(flowerOne: "NH-orange_hyacinth_icon", flowerTwo: "NH-orange_hyacinth_icon", result: "NH-purple_hyacinths-icon"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    "Mums",
                    style: TextStyle(
                        fontFamily: 'Fink',
                        color:
                            User.darkKnightMode ? textDarkTheme : Colors.black,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    _buildFlower(flowerOne: "NH-red_mums-icon", flowerTwo: "NH-white_mum_icon", result: "NH-pink_mums-icon"),
                    _buildFlower(flowerOne: "NH-white_mum_icon", flowerTwo: "NH-white_mum_icon", result: "NH-purple_mums-icon"),
                    _buildFlower(flowerOne: "NH-purple_mums-icon", flowerTwo: "NH-purple_mums-icon", result: "NH-green_mums-icon"),
                  ],
                ),
              ),
              SizedBox(height: 40.0,)
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildFlower({String flowerOne, String flowerTwo, String result}) {
    return TableRow(children: <Widget>[
      Container(
        child: Image.asset(
          "res/flowers/" + flowerOne + ".png",
          height: 50,
        ),
      ),
      Center(
          child: Text("+",
              style: TextStyle(
                  fontSize: 40,
                  color: User.darkKnightMode ? textDarkTheme : Colors.black))),
      Container(
        child: Image.asset(
          "res/flowers/" + flowerTwo + ".png",
          height: 50,
        ),
      ),
      Center(
          child: Text("=",
              style: TextStyle(
                  fontSize: 40,
                  color: User.darkKnightMode ? textDarkTheme : Colors.black))),
      Container(
        child: Image.asset(
          "res/flowers/" + result + ".png",
          height: 50,
        ),
      ),
    ]);
  }
}
