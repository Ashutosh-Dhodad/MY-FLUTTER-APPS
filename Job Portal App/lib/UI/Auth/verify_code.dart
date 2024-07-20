import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/UI/posts/Admin/adminPostedJobs.dart';
import 'package:firebasetask/Widgets/roundedButton.dart';
import 'package:firebasetask/utils/utils.dart';
import 'package:flutter/material.dart';

class verifyCode extends StatefulWidget {
  final String verificationId;
  const verifyCode({super.key, required this.verificationId});

  @override
  State<verifyCode> createState() => _verifyCodeState();
}

class _verifyCodeState extends State<verifyCode> {


  final verificationCodeController = TextEditingController();
  bool loading  = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
           const SizedBox(height: 80,),
        
            TextFormField(
              keyboardType: TextInputType.number,
              controller: verificationCodeController,
              decoration:const InputDecoration(
                hintText: 'enter 6 digit number',
              ),
            ),
        
            const SizedBox(height: 80,),

            roundedButton(
              title: 'verify',
              loading: loading,
              onTap: ()async{
                  setState(() {
                    loading=true;
                  });

                  final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId, 
                    smsCode: verificationCodeController.text.toString()
                    );

                    try{
                      await auth.signInWithCredential(credential);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  JobManagement()));
                    }catch(e){
                      setState(() {
                        loading=false;
                      });

                      utils().toastMessage(e.toString(), false);
                    }
               
              }
              )
          ],
        ),
      ),
    );
  }

}