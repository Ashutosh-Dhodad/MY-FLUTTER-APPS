import 'package:firebasetask/UI/posts/Admin/allApplicantsScreen.dart';
import 'package:firebasetask/UI/posts/Admin/job.dart';
import 'package:firebasetask/firebaseServices/job_service.dart';
import 'package:flutter/material.dart';
import 'adminJobAdd.dart';

class JobManagement extends StatefulWidget{
  const JobManagement({super.key});

  State createState()=> _JobManagementState();
}

class _JobManagementState extends State {
  final JobService _jobService = JobService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Management',
      style: TextStyle(
        color: Colors.white
      ),),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      ),
      body: StreamBuilder<List<Job>>(
        stream: _jobService.getJobs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Job> jobs = snapshot.data!;
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                Job job = jobs[index];
                return Column(
                  children: [
                    Container(
                      height: 150,
                      width: 330,
                      margin:const EdgeInsets.only(top: 15, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color.fromARGB(255, 142, 140, 140))
                      ),
                      
                        child: ListTile(
                          title: Text(job.title,
                          style:const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(job.company,
                              style:const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),),

                              
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: ElevatedButton(
                                    onPressed: (){
                                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  allApplicantsScreen(id:job.id),
                              ),
                            );
                                    },
                                    
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:const Color.fromARGB(255, 96, 141, 175)
                                    ),
                                
                                    child: const Text("Tap to see Applicant's",
                                    style: TextStyle(color: Colors.white),),
                                    ),
                                ),
                            
                             
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetails(job: job),
                              ),
                            );
                          },
                          trailing: Container(
                            margin:const EdgeInsets.only(top: 20),
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              color:const Color.fromARGB(255, 96, 141, 175),
                              onPressed: () async {
                                bool confirmed = await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Delete Job'),
                                        content: const Text(
                                            'Are you sure you want to delete this job?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    ) ??
                                    false;
                            
                                if (confirmed) {
                                  await _jobService.deleteJob(job.id);
                                }
                              },
                            ),
                          ),
                        ),
                      
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobDetails()),
          );
        },
        child: const Icon(Icons.add,color: Colors.green),
      ),
      backgroundColor: Colors.white,
    );
  }
}
