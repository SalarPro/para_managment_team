import 'package:flutter/material.dart';
import 'package:para_managment_team/src/settings/settings_controller.dart';

class CardView extends StatefulWidget {
  CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Card"),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.amber,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Job Title: ",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        Text("Job Description: ",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                      ],
                    ),
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(child: Text("200")),
                                Container(child: Text("Likes")),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
