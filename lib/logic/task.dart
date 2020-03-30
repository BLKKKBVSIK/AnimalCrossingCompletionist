import 'package:flutter/material.dart';

class Task
{
  String description;
  bool hasImage;
  Widget image;
  bool done;
  String season;
  String location;
  String time;
  String price;
  bool jan;
  bool fev;
  bool mar;
  bool apr;
  bool may;
  bool jun;
  bool jul;
  bool aug;
  bool sep;
  bool oct;
  bool nov;
  bool dec;

  //Task(this.emoji, this.description, {this.image = Image()}  {this.done: false});

  Task(this.description, this.hasImage, {this.season, this.location, this.time, this.price, this.jan, this.fev, this.mar, this.apr, this.may, this.jun, this.jul, this.aug, this.sep, this.oct, this.nov, this.dec, this.image, this.done = false}) {
    image ??= Image.asset('res/fishs/bitterling.png', width: 50,);
  }
}