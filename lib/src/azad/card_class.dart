import 'package:flutter/material.dart';
import 'package:para_managment_team/src/salar/job_model.dart';
import 'package:para_managment_team/src/settings/settings_controller.dart';

Card cardView(Job job) {
  return Card(
    color: Colors.amber,
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                job.title ?? "",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              Text(job.jobDescription ?? "",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ],
          ),
          Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.black),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("${job.likedUID?.length ?? 0}"),
                      Text("Likes"),
                    ],
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}
