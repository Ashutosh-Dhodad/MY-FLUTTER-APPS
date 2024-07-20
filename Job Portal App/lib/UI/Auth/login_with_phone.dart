import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/UI/Auth/verify_code.dart';
import 'package:firebasetask/Widgets/roundedButton.dart';
import 'package:firebasetask/utils/utils.dart';
import 'package:flutter/material.dart';

class loginWithPhone extends StatefulWidget {
  const loginWithPhone({super.key});

  @override
  State<loginWithPhone> createState() => _loginWithPhoneState();
}

class _loginWithPhoneState extends State<loginWithPhone> {

  final phoneNumberController = TextEditingController();
  bool loading  = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
           const SizedBox(height: 80,),
        
            TextFormField(
              keyboardType: TextInputType.text,
              controller: phoneNumberController,
              decoration:const InputDecoration(
                hintText: 'enter phone number',
              ),
            ),
        
            const SizedBox(height: 80,),

            roundedButton(
              title: 'Login',
              loading: loading,
              onTap: (){
                setState(() {
                  loading=true;
                });
                auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                    setState(() {
                      loading=false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading=false;
                    });
                    utils().toastMessage(e.toString(), false);
                  }, 
                  codeSent: ( String verificationId, int? token) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  verifyCode(verificationId: verificationId,)));
                    setState(() {
                      loading=false;
                    });
                  }, 
                  codeAutoRetrievalTimeout: (e){
                    utils().toastMessage(e.toString(), false);
                    setState(() {
                      loading=false;
                    });
                  });
              }
              )
          ],
        ),
      ),
    );
  }
}