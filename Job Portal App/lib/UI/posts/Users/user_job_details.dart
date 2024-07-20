
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetask/controller/job_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class JobDetailPage extends StatefulWidget{
   final String jobId;
    const JobDetailPage ( {required this.jobId,super.key});

  @override
  State createState()=>_JobDetailPageState(jobId: jobId);
}
class _JobDetailPageState extends State {
  final String jobId;
  //bool isApplied = false;
  


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _getEmails() async {
    DocumentSnapshot doc = await _firestore.collection('jobs').doc(jobId).collection('applicants').doc("j6l0caVKsDhGx3OMGIPt").get();

    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      List<dynamic>? applicants = data?['applicants'];

      if (applicants != null) {
        for (String applicantId in applicants) {
          DocumentSnapshot applicantDoc = await _firestore.collection('users').doc(applicantId).get();
          if (applicantDoc.exists) {
            Map<String, dynamic>? applicantData = applicantDoc.data() as Map<String, dynamic>?;
            String? email = applicantData?['email'];
            log('Applicant Email: $email');
          }
        }
      }
    } else {
      log('Document does not exist');
    }
  }


  _JobDetailPageState({required this.jobId});


  @override
  Widget build(BuildContext context) {

    var jobProvider = Provider.of<JobDetailsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('jobs').doc(jobId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('Job not found'));
            }
            final job = snapshot.data!;
            DateTime postedDate = (job['postedDate'] as Timestamp).toDate();
            String formattedDate = DateFormat('yyyy-MM-dd').format(postedDate);
            return Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job['title'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text(formattedDate, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30),
                  const Text("Full job description", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Job Title: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      Text(job['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text("Company: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      Text(job['company'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text("Details: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  Text(job['description'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 50,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: FloatingActionButton(
          backgroundColor: (jobProvider.isAppliedFirst )?  Colors.grey : Colors.green,
          onPressed: () {
            if(jobProvider.isAppliedFirst==false || jobProvider.isSecondApplied==false){
              applyForJob(context);
            }
            
          },
          child:Consumer<JobDetailsProvider>(builder:(context, value, child) {
            return (value.isAppliedFirst)? 
          const Text('Applied', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)):
          const Text('Apply Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white));
          },)
          
          
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }




//   void _getApplicantData(String jobId) async {

//   try {
//     // Get the applicants collection for the specified job
//     CollectionReference applicantsRef = FirebaseFirestore.instance.collection('jobs').doc(jobId).collection('applicants');
    
//     // Fetch all documents in the applicants collection
//     QuerySnapshot querySnapshot = await applicantsRef.get();

//     for (var doc in querySnapshot.docs) {
//       // Extract email and resume link from each document
//       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//       String email = data['user'];
//       String resume = data['resume'];
  
//       final auth = FirebaseAuth.instance;
//       final user = auth.currentUser!.email;
//       if(user!.contains(email)){
//         isAppliedToJob();
//       }
//       log('Applicant Email: $email');
//       log('Resume Link: $resume');
//       log("private email: $email ");
//     }
    
//   } catch (e) {
//     log('Error getting applicant data: $e');
//   }

// }



   void applyForJob(BuildContext context) async {
    var jobProvider = Provider.of<JobDetailsProvider>(context,listen: false);
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    // Assuming the user picks a single file
    PlatformFile file = result.files.first;

    // Upload file to Firebase Storage
    UploadTask uploadTask = FirebaseStorage.instance
        .ref('resumes/${file.name}')
        .putFile(File(file.path!));

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser!.email;

    // Add the job application details to Firestore
    FirebaseFirestore.instance.collection('jobs').doc(jobId).collection('applicants').add({
      'resume': downloadURL, /// Storing the file download URL
      'user' : user,
      // Add other necessary fields here
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Application submitted successfully!'),
      ));
      
        jobProvider.getApplicantData(jobId); // Fetch applicant data
      
      
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to submit application: $error'),
      ));
    });
  } else {
    // User canceled the picker
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.red,
      content: Text('No file selected'),
    ));
  }
}

  

}
