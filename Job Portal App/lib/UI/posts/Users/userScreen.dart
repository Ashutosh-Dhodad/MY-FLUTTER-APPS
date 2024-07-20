
import 'package:firebasetask/UI/posts/Users/user_job_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class userScreen extends StatefulWidget {
  const userScreen({super.key});

  State createState() => _UserScreenState();
}

class _UserScreenState extends State<userScreen> {
  final searchJobController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  Future<void> _searchJobs(String keyword) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('jobs')
          .where('title', isGreaterThanOrEqualTo: keyword)
          .where('title', isLessThanOrEqualTo: keyword + '\uf8ff')
          .get();

      setState(() {
        _searchResults = querySnapshot.docs;
      });
    } catch (e) {
      print('Error searching jobs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Let's Find Your Job",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: searchJobController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchJobs(searchJobController.text.trim());
                  },
                ),
                hintText: 'Job title, keywords, or company',
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 192, 191, 191))),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Job feed",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _searchResults.isEmpty
                ? StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('jobs')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                            child: Text('No jobs available'));
                      }
                      final jobs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          DateTime postedDate =
                              (job['postedDate'] as Timestamp).toDate();
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(postedDate);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      JobDetailPage(jobId: job.id),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15),
                              padding: const EdgeInsets.all(20),
                              height: 155,
                              width: 300,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 156, 152, 152)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    job['title'],
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    job['company'],
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final job = _searchResults[index];
                      DateTime postedDate =
                          (job['postedDate'] as Timestamp).toDate();
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(postedDate);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  JobDetailPage(jobId: job.id),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 15),
                          padding: const EdgeInsets.all(20),
                          height: 155,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 156, 152, 152)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job['title'],
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                job['company'],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


// class JobDetailPage extends StatelessWidget {
//   final String jobId;

//   bool isApplied = false;

//   void isAppliedToJob(){
//     isApplied = true;
//   }

//   JobDetailPage({required this.jobId});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Job Details', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('jobs').doc(jobId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(child: Text('Job not found'));
//           }
//           final job = snapshot.data!;
//           DateTime postedDate = (job['postedDate'] as Timestamp).toDate();
//           String formattedDate = DateFormat('yyyy-MM-dd').format(postedDate);
//           return Padding(
//             padding: const EdgeInsets.only(left: 20, top: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(job['title'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
//                 const SizedBox(height: 10),
//                 Text(formattedDate, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
//                 const SizedBox(height: 30),
//                 const Text("Full job description", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     const Text("Job Title: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                     Text(job['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     const Text("Company: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                     Text(job['company'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 const Text("Details: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//                 Text(job['description'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         height: 50,
//         width: 200,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//         child: FloatingActionButton(
//           backgroundColor:(isApplied)?  Colors.grey : Colors.green,
//           onPressed: () {
//             Future<bool> val= applyForJob(context);
            
//           },
//           child:(isApplied)? const Text('Apply Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)):const Text('Applied', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//    Future<bool> applyForJob(BuildContext context) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       // Assuming the user picks a single file
//       PlatformFile file = result.files.first;

//       // Upload file to Firebase Storage
//       UploadTask uploadTask = FirebaseStorage.instance
//           .ref('resumes/${file.name}')
//           .putFile(File(file.path!));

//       TaskSnapshot taskSnapshot = await uploadTask;
//       String downloadURL = await taskSnapshot.ref.getDownloadURL();

//       // Add the job application details to Firestore
//       FirebaseFirestore.instance.collection('jobs').doc(jobId).collection('applicants').add({
//         'resume': downloadURL, // Storing the file download URL
//         // Add other necessary fields here
//       }).then((_) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           backgroundColor: Colors.green,
//           content: Text('Application submitted successfully!'),
          
//         ));
//         isAppliedToJob();
//          log("is applied${isApplied}" );
//         return true;
        
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('Failed to submit application: $error'),
//         ));
//         return false;
//       });
//     } else {
//       // User canceled the picker
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('No file selected'),
//       ));
//       return false;
//     }

//     return false;
//   }
  

// }
