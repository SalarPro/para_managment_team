import 'package:flutter/cupertino.dart';

class JobCategory {
  String? uid;
  String? name;

  JobCategory({this.uid, this.name});
}

List<JobCategory> tempCategory = [
  JobCategory(uid: "1", name: "Front-End developer"),
  JobCategory(uid: "2", name: "Back-End developer"),
  JobCategory(uid: "3", name: "Data Security"),
  JobCategory(uid: "4", name: "Data analytics"),
  JobCategory(uid: "5", name: "Full stack developer"),
];

List<Widget> getListOfWidget() {
  List<Widget> widgets = [];

  tempCategory.forEach((element) {
    widgets.add(Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(element.name ?? ""),
    ));
  });

  return widgets;
}

List<bool> getListOfWidgetBool() {
  List<bool> widgets = [];

  tempCategory.forEach((element) {
    widgets.add(element.uid == "1");
  });

  return widgets;
}
