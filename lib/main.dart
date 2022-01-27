import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:para_managment_team/src/salar/firebase_datamanaging.dart';
import 'package:para_managment_team/src/salar/job_model.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => debugPrint("firebase done"));

  FirebaseJob.addJob(Job(
    uid: "num1",
    title: "We Code",
    category: "Programming",
    companyName: "We Code",
    jobDescription: "Hello",
    email: "info@salarpro.com",
    numberOfHires: 4,
    salaryEstimation: 1500,
    validateTil: Timestamp.fromDate(DateTime(2022,2,1)),
    createdAt: Timestamp.fromDate(DateTime.now()),
    likedUID: ["salar","azad"],
    numberOfViews: 0,
  ));

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
