import 'dart:ui';

class CoursesItem {
  String title;
  String image;
  String number;
  Color color;
  Function() onTap;

  CoursesItem(
      {required this.title,
      required this.image,
      required this.number,
      required this.color,
      required this.onTap});
}

class CollegesItem {
  String title;
  String image;
  Color color;
  Function() onTap;

  CollegesItem(
      {required this.title,
      required this.image,
      required this.color,
      required this.onTap});
}
