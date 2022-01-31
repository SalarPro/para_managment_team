import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:para_managment_team/src/salar/firebase_datamanaging.dart';
import 'package:para_managment_team/src/salar/job_model.dart';
import 'package:para_managment_team/src/temp/categories.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  // final categoryController = TextEditingController();
  final companyNameController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  final numberOfHiresController = TextEditingController();
  final salaryEstimationController = TextEditingController();
  final validateTilController = TextEditingController();
  final emailController = TextEditingController();

  String dropdownValue = tempCategory[0].name!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add a new job",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var uid = Uuid().v1();
                FirebaseJob.addJob(Job(
                  uid: uid.toString(),
                  title: titleController.value.text,
                  category: getUIDForCategory(
                      dropdownValue) /*categoryController.value.text*/,
                  companyName: companyNameController.value.text,
                  jobDescription: jobDescriptionController.value.text,
                  email: emailController.value.text,
                  numberOfHires: int.parse(numberOfHiresController.value.text),
                  salaryEstimation:
                      double.parse(salaryEstimationController.value.text),
                  validateTil: Timestamp.fromDate(
                      DateTime.parse(validateTilController.value.text)),
                  createdAt: Timestamp.fromDate(DateTime.now()),
                  likedUID: [],
                  numberOfViews: 0,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title *
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Title',
                  ),
                ),
              ),
              //Cactegory *
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job Category"),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          /*underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                ),*/

                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: tempCategory
                              .map((e) => e.name ?? "")
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                  /*
                 TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: categoryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category',
                  ),
                ),*/
                  ),
              //Company name *
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: companyNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Company name',
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: jobDescriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'job description',
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: numberOfHiresController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'how many hires',
                  ),
                ),
              ),
              //job desc
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: salaryEstimationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'salary estimation',
                  ),
                ),
              ),
              //job desc
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050))
                        .then((value) {
                      setState(() {
                        validateTilController
                          ..text = DateFormat("yyyy-MM-dd")
                              .format(value ?? DateTime.now());
                        validateTilController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: validateTilController.text.length,
                                affinity: TextAffinity.upstream));
                      });
                    });
                  },
                  readOnly: true,
                  controller: validateTilController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'valid till date',
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'send CV to email',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
