
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class JobDetailsProvider extends ChangeNotifier {

  bool isAppliedFirst = false;
  bool isSecondApplied = false;

  List<Map<String, String>> usersList = [];

  void addUser(String email, String resume) {
    
      usersList.add({
        'email': email,
        'resume': resume,
      });
      notifyListeners();
   
  }
  
  void getApplicantData(String jobId) async {

  try {
    // Get the applicants collection for the specified job
    CollectionReference applicantsRef = FirebaseFirestore.instance.collection('jobs').doc(jobId).collection('applicants');
    
    // Fetch all documents in the applicants collection
    QuerySnapshot querySnapshot = await applicantsRef.get();


    for (var doc in querySnapshot.docs) {
      // Extract email and resume link from each document
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
       String email = data['user'];
       String resume = data['resume'];
       addUser(email, resume);
  
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!.email;
      if(user!.trim().toLowerCase() == email.trim().toLowerCase()){
        isAppliedToJob();
      }
      log('Applicant Email: $email');
      log('Resume Link: $resume');
      log("private email: $email ");
     
    }
    
  } catch (e) {
    log('Error getting applicant data: $e');
  }

  notifyListeners();

}

void isAppliedToJob(){
  isAppliedFirst = true;  
  notifyListeners();     
}

}