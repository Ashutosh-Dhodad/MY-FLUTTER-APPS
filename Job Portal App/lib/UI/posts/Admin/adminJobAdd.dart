
import 'package:firebasetask/UI/posts/Admin/job.dart';
import 'package:firebasetask/firebaseServices/job_service.dart';
import 'package:firebasetask/firebaseServices/authService.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  final Job? job;

  JobDetails({super.key, this.job});

  final _formKey = GlobalKey<FormState>();
  final JobService _jobService = JobService();

  String _title = '';
  String _description = '';
  String _company = '';

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final user = auth.getUser();

    return Scaffold(
      appBar: AppBar(title: Text(job == null ? 'Add Job' : 'Edit Job',
      style:const TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: job?.title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Job Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job title';
                    }
                    _title = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: job?.description,
                  maxLines: 15,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Job Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a job description';
                    }
                    _description = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: job?.company,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Company Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a company name';
                    }
                    _company = value;
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                Container(
                  height: 50,
                  width: 170,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (job == null) {
                          await _jobService.addJob(Job(
                            id: '',
                            title: _title,
                            description: _description,
                            company: _company,
                            postedDate: DateTime.now(),
                            
                           
                          ));
                        } else {
                          await _jobService.updateJob(
                            job!.id,
                            Job(
                              id: job!.id,
                              title: _title,
                              description: _description,
                              company: _company,
                              postedDate: job!.postedDate,
                            
                             
                            ),
                          );
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                    child: Text(job == null ? ' Add Job ' : 'Save Changes',
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
