import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Job {
  String? uid;
  String? title;
  String? category;
  String? companyName;
  String? jobDescription;
  String? email;
  int? numberOfHires;
  double? salaryEstimation;
  Timestamp? validateTil;
  Timestamp? createdAt;
  List<String>? likedUID;
  int? numberOfViews;
  Job({
    this.uid,
    this.title,
    this.category,
    this.companyName,
    this.jobDescription,
    this.email,
    this.numberOfHires,
    this.salaryEstimation,
    this.validateTil,
    this.createdAt,
    this.likedUID,
    this.numberOfViews,
  });


  Job copyWith({
    String? uid,
    String? title,
    String? category,
    String? companyName,
    String? jobDescription,
    String? email,
    int? numberOfHires,
    double? salaryEstimation,
    Timestamp? validateTil,
    Timestamp? createdAt,
    List<String>? likedUID,
    int? numberOfViews,
  }) {
    return Job(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      category: category ?? this.category,
      companyName: companyName ?? this.companyName,
      jobDescription: jobDescription ?? this.jobDescription,
      email: email ?? this.email,
      numberOfHires: numberOfHires ?? this.numberOfHires,
      salaryEstimation: salaryEstimation ?? this.salaryEstimation,
      validateTil: validateTil ?? this.validateTil,
      createdAt: createdAt ?? this.createdAt,
      likedUID: likedUID ?? this.likedUID,
      numberOfViews: numberOfViews ?? this.numberOfViews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'category': category,
      'companyName': companyName,
      'jobDescription': jobDescription,
      'email': email,
      'numberOfHires': numberOfHires,
      'salaryEstimation': salaryEstimation,
      'validateTil': validateTil,
      'createdAt': createdAt,
      'likedUID': likedUID,
      'numberOfViews': numberOfViews,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      uid: map['uid'],
      title: map['title'],
      category: map['category'],
      companyName: map['companyName'],
      jobDescription: map['jobDescription'],
      email: map['email'],
      numberOfHires: map['numberOfHires']?.toInt(),
      salaryEstimation: map['salaryEstimation']?.toDouble(),
      validateTil: map['validateTil'],
      createdAt: map['createdAt'],
      likedUID: List<String>.from(map['likedUID']),
      numberOfViews: map['numberOfViews']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Job(uid: $uid, title: $title, category: $category, companyName: $companyName, jobDescription: $jobDescription, email: $email, numberOfHires: $numberOfHires, salaryEstimation: $salaryEstimation, validateTil: $validateTil, createdAt: $createdAt, likedUID: $likedUID, numberOfViews: $numberOfViews)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Job &&
      other.uid == uid &&
      other.title == title &&
      other.category == category &&
      other.companyName == companyName &&
      other.jobDescription == jobDescription &&
      other.email == email &&
      other.numberOfHires == numberOfHires &&
      other.salaryEstimation == salaryEstimation &&
      other.validateTil == validateTil &&
      other.createdAt == createdAt &&
      listEquals(other.likedUID, likedUID) &&
      other.numberOfViews == numberOfViews;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      title.hashCode ^
      category.hashCode ^
      companyName.hashCode ^
      jobDescription.hashCode ^
      email.hashCode ^
      numberOfHires.hashCode ^
      salaryEstimation.hashCode ^
      validateTil.hashCode ^
      createdAt.hashCode ^
      likedUID.hashCode ^
      numberOfViews.hashCode;
  }
}
