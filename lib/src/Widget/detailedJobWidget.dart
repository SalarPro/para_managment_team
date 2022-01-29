import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:para_managment_team/src/job_board/job_board_screen.dart';
import 'package:intl/intl.dart';
import 'package:para_managment_team/src/salar/firebase_datamanaging.dart';
import 'package:para_managment_team/src/salar/job_model.dart';

// ignore: camel_case_types
class DetailedJobWidget extends StatefulWidget {
  const DetailedJobWidget({
    Key? key,
    this.mJob,
  }) : super(key: key);

  final Job? mJob;

  @override
  _DetailedJobWidgetState createState() => _DetailedJobWidgetState(mJob);
}

// ignore: camel_case_types
class _DetailedJobWidgetState extends State<DetailedJobWidget> {
  final Job? mJob;

  @override
  void initState() {
    super.initState();

    FirebaseJob.addViewFor(selectedJob);
  }

  _DetailedJobWidgetState(this.mJob);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 100, right: 30, left: 30),
      padding: EdgeInsets.all(20),
      width: 350,
      height: 500,
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(child: Icon(Icons.thumb_up_alt)),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("jobs")
                      .doc(selectedJob.uid)
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
                      return Text("${t.likedUID?.length ?? 0}");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 195), child: Icon(Icons.star))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Icon(Icons.remove_red_eye_rounded))),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Text("${selectedJob.numberOfViews ?? 0}")),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 207, 206),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(15),
            height: 380,
            width: 300,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Job title : '),
                    Text(selectedJob.title ?? "")
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text('Company : '),
                      Text(selectedJob.companyName ?? "")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Email : '), Text(selectedJob.email ?? "")],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text('No of Hires : '),
                      Text(("${selectedJob.numberOfHires ?? "0"}"))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text('Salary(Month) : '),
                      Text("${selectedJob.salaryEstimation ?? "0"} \$")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text('Category : '),
                      Text(selectedJob.jpbCategory.name ?? "")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Job description : ')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          selectedJob.jobDescription ?? "",
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text('Create at : '),
                      Text(DateFormat('yyyy/MM/dd hh:kk')
                          .format(selectedJob.createdAt!.toDate()))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text('Validate till: '),
                      Text(DateFormat('yyyy/MM/dd hh:kk')
                          .format(selectedJob.validateTil!.toDate()))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
