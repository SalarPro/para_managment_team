import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<List<Job>> getAllJobs() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("jobs")
        .orderBy("createdAt")
        .get();

    List<Job> listOfJobs = [];

    snapshot.docs.forEach((element) {
      listOfJobs.add(Job.fromMap(element.data()));
    });

    return listOfJobs;
  }

  static addJob(Job job) async {
    await FirebaseFirestore.instance.collection("jobs").doc().set(job.toMap());
  }

  static updateJob(Job job) async {
    await FirebaseFirestore.instance
        .collection("jobs")
        .doc(job.uid)
        .set(job.toMap());
  }
}
