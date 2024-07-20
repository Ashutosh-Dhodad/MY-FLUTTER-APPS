import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/UI/Auth/login_with_phone.dart';
import 'package:firebasetask/UI/Auth/signUpScreen.dart';
import 'package:firebasetask/UI/posts/Admin/adminPostedJobs.dart';
import 'package:firebasetask/UI/posts/Users/userScreen.dart';
import 'package:firebasetask/Widgets/roundedButton.dart';
import 'package:firebasetask/controller/provider.dart';

import 'package:firebasetask/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  bool showPassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool userloading = false;
  bool adminloading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
  }

  void userLogin(){
     setState(() {
                    userloading = true;
               

              });

              _auth.signInWithEmailAndPassword(
               email: emailController.text,
               password: passWordController.text.toString()).then((value) {
              utils().toastMessage("Login Successfully!!!", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  userScreen()));
               setState(() {
                     userloading = false;
                     
               });

               }).onError((error, stackTrace) {
                utils().toastMessage("Please Enter valid credentials", false);

                setState(() {
                  userloading = false;
                 });
               });
  }

  void adminLogin(){
     setState(() {
                    adminloading = true;
              });

              _auth.signInWithEmailAndPassword(
               email: emailController.text,
               password: passWordController.text.toString()).then((value) {
              utils().toastMessage("Login Successfully!!!", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  JobManagement()));
               setState(() {
                     adminloading = false;
                     
               });

               }).onError((error, stackTrace) {
                utils().toastMessage("Please Enter valid credentials", false);

                setState(() {
                  adminloading = false;
                 });
               });
  }

    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
     
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Container(
              height: 150,
              width: 150,
              decoration:const  BoxDecoration(color:  Colors.deepPurpleAccent, shape: BoxShape.circle),
              child:const Center(child:  Icon(Icons.person, size: 150, color: Colors.deepPurple,))),
            const SizedBox(height: 50,),
        
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration:const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email),
        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple)
                        )
                      ),
                    
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
        
                  const SizedBox(height: 10,),
        
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passWordController,
                      obscureText: showPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          radius: 20,
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            setState(() {
                               showPassword=!showPassword;
                            });
                          },
                          child:  Icon(showPassword? Icons.visibility : Icons.visibility_off)),
                    
                         enabledBorder:const  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                    
                          focusedBorder:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.deepPurple)
                          )
                      ),
                    
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
        
                ],
              ),
            ),
        
            const SizedBox(height: 50,),
            roundedButton(title: 'Login as User ',
            loading: userloading,
            onTap: (){
              if(_formKey.currentState!.validate()){

                userLogin();
              }
            },),
        
            const SizedBox(height: 10,),
            roundedButton(title: 'Login as Admin ',
            loading: adminloading,
            onTap: (){
              if(_formKey.currentState!.validate()){
                
                adminLogin();
              }
            },),
        
            const SizedBox(height: 10,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const loginWithPhone()));
              },
              child: Container(
                margin:const  EdgeInsets.only(left: 20, right: 20),
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple),
                child:const Center(
                  child:  Text("Login with phone number",
                  style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
        
            const SizedBox(height: 10,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
        
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const signUpScreen()));
                },
                child: const Text("Sign Up")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}