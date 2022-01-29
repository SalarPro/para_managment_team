import 'package:flutter/material.dart';
import 'package:para_managment_team/src/azad/card_class.dart';
import 'package:para_managment_team/src/salar/firebase_datamanaging.dart';
import 'package:para_managment_team/src/salar/job_model.dart';
import 'package:para_managment_team/src/temp/categories.dart';

class JobBoardScreen extends StatefulWidget {
  const JobBoardScreen({Key? key}) : super(key: key);

  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  List<bool> _selections = getListOfWidgetBool();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Board"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search job',
                      ),
                      onTap: () {
                        showSearch(
                            context: context, delegate: JobSearchDelegate());
                      }),
                ),
              ),
              Expanded(
                child: PopupMenuButton(
                    child: Row(
                      children: const [
                        Text("sort By"),
                        Icon(Icons.arrow_drop_down_circle_outlined),
                      ],
                    ),
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("First"),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text("Second"),
                            value: 2,
                          )
                        ]),
              )
            ],
          ),
          const Text('Categories'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              children: getListOfWidget(),
              isSelected: _selections,
              onPressed: (int newindex) {
                setState(() {
                  for (int i = 0; i < _selections.length; i++) {
                    if (i == newindex) {
                      _selections[i] = true;
                    } else {
                      _selections[i] = false;
                    }
                  }
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Job>>(
              future: FirebaseJob.getAllJobs2(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        Job job = snapshot.data![index];
                        return GestureDetector(
                          child: cardView(job),
                          onTap: () {
                            selectedJob = job;
                            Navigator.restorablePushNamed(
                              context,
                              '/DetailedJobWidget',
                            );
                          },
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class JobSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Job> matchQuery = [];

    return FutureBuilder<List<Job>>(
      future: FirebaseJob.getAllJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var item in snapshot.data!) {
            if (item.title!.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(item);
            }
          }
          return ListView.builder(
              itemCount: matchQuery?.length ?? 0,
              itemBuilder: (context, index) {
                Job job = matchQuery[index];

                return cardView(job);
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Job> matchQuery = [];

    return FutureBuilder<List<Job>>(
      future: FirebaseJob.getAllJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var item in snapshot.data!) {
            if (item.title!.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(item);
            }
          }
          return ListView.builder(
              itemCount: matchQuery?.length ?? 0,
              itemBuilder: (context, index) {
                Job job = matchQuery[index];

                return cardView(job);
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Job selectedJob = Job();
