import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:para_managment_team/src/salar/job_model.dart';

class FirebaseJob {
  static Stream<List<Job>> countStream() async* {
    List<Job> listOfJobs = [];
    var snapshot = FirebaseFirestore.instance
        .collection("jobs")
        .orderBy("createdAt")
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listOfJobs = [];
        listOfJobs.add(Job.fromMap(element.data()));
      });
    });
    yield listOfJobs;
  }

  static Future<List<Job>> getAllJobs(
      {String? category = '', bool desc = false}) async {
    var snapshot = await FirebaseFirestore.instance
        .collection("jobs")
        .orderBy("createdAt", descending: desc)
        .get();

    List<Job> listOfJobs = [];

    snapshot.docs.forEach((element) {
      Job job = Job.fromMap(element.data());
      debugPrint(category);
      if (category == "0" || category == '') {
        listOfJobs.add(job);
      } else if (job.category == category) {
        listOfJobs.add(job);
      }
    });

    return listOfJobs;
  }

  static addJob(Job job) async {
    await FirebaseFirestore.instance
        .collection("jobs")
        .doc(job.uid)
        .set(job.toMap());
  }

  static updateJob(Job job) async {
    await FirebaseFirestore.instance
        .collection("jobs")
        .doc(job.uid)
        .set(job.toMap());
  }

  static addViewFor(Job job) async {
    await FirebaseFirestore.instance
        .collection("jobs")
        .doc(job.uid)
        .update(Map.of({"numberOfViews": FieldValue.increment(1)}));
  }
}
