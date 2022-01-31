import 'package:cloud_firestore/cloud_firestore.dart';
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
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("jobs")
                            .doc(job.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var tDoc = (snapshot.data
                                    as DocumentSnapshot<Map<String, dynamic>>)
                                .data();
                            if (tDoc == null) {
                              return CircularProgressIndicator();
                            }
                            Job t = Job.fromMap(tDoc);
                            return Text("${t.likedUID?.length ?? 0} Likes");
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("jobs")
                            .doc(job.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var tDoc = (snapshot.data
                                    as DocumentSnapshot<Map<String, dynamic>>)
                                .data();
                            if (tDoc == null) {
                              return CircularProgressIndicator();
                            }
                            Job t = Job.fromMap(tDoc);
                            return Text("${t.numberOfViews ?? 0} Views");
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}
