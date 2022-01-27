import 'package:flutter/material.dart';

// ignore: camel_case_types
class detailedJobWidget extends StatefulWidget {
  const detailedJobWidget({Key? key}) : super(key: key);

  @override
  _detailedJobWidgetState createState() => _detailedJobWidgetState();
}

// ignore: camel_case_types
class _detailedJobWidgetState extends State<detailedJobWidget> {
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
                  child: Text('120')),
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
                  child: Text('360')),
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
                  children: [Text('Job title : '), Text('IT')],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Company : '), Text('Dell')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Email : '), Text('company@data.com')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('No of hours(Day) : '), Text('9')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Salary(Month) : '), Text('1200')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [Text('Category : '), Text('IT')],
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
                          ' IT Specialists often have the following responsibilities: Review diagnostics and assess the functionality and efficiency of systems. Implement security measures. Monitor security certificates and company compliance of requirements ',
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 120),
                  child: Row(
                    children: [Text('Create at : '), Text('1/2/2021')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 120),
                  child: Row(
                    children: [Text('Validate till: '), Text('1/2/2021')],
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
