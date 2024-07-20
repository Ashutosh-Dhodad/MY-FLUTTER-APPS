import 'dart:developer';

import 'package:firebasetask/controller/job_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class allApplicantsScreen extends StatefulWidget {
  final String id;
  const allApplicantsScreen({required this.id, super.key});

  @override
  State<allApplicantsScreen> createState() => _allApplicantsScreenState(id:id);
}

class _allApplicantsScreenState extends State<allApplicantsScreen> {
final String id;
 _allApplicantsScreenState({required this.id});

  void initState() {
    super.initState();
    Provider.of<JobDetailsProvider>(context, listen: false).getApplicantData(id);
  }

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobDetailsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Job Applicants",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: jobProvider.usersList.length,
        itemBuilder: (context, index) {
          var user = jobProvider.usersList[index];
          log("this is user: ${user['email']}");
          return Container(
            padding: const EdgeInsets.all(10),
            margin:const EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text.rich(
                        TextSpan(
                          text: 'User Email: ',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${user['email']}",
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                const SizedBox(height: 20,),

               Text.rich(
                        TextSpan(
                          text: 'User Resume URL: ',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${user['resume']}",
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
