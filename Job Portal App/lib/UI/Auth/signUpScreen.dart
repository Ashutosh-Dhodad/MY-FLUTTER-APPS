import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/UI/Auth/loginScreen.dart';
import 'package:firebasetask/Widgets/roundedButton.dart';
import 'package:firebasetask/controller/provider.dart';
import 'package:firebasetask/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  bool userloading = false;
  bool Adminloading = false;
  bool isUser = false;
  bool isAdmin = false;
  final _fonmKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
  }

  void userSignUp(){
              setState(() {
                    userloading = true;
                    isUser = true;
              });

              _auth.createUserWithEmailAndPassword(
               email: emailController.text.toString(),
               password: passWordController.text.toString()).then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const loginScreen()));
               setState(() {
                     userloading = false;
               });

               }).onError((error, stackTrace) {
                utils().toastMessage("Please enter valid credentials!!!", false);

                setState(() {
                  userloading = false;
                 });
               });
  }

   void adminSignup(){
              setState(() {
                    Adminloading = true;
                    isAdmin = true;
              });

              _auth.createUserWithEmailAndPassword(
               email: emailController.text.toString(),
               password: passWordController.text.toString()).then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const loginScreen()));
               setState(() {
                     Adminloading = false;
               });

               }).onError((error, stackTrace) {
                utils().toastMessage("Please enter valid credentials!!!", false);

                setState(() {
                  Adminloading = false;
                 });
               });
  }



  @override
  Widget build(BuildContext context) {
     var provider = Provider.of<myProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
        
             Container(
                height: 150,
                width: 150,
                decoration:const  BoxDecoration(color:  Colors.deepPurpleAccent, shape: BoxShape.circle),
                child:const Center(child:  Icon(Icons.person, size: 150, color: Colors.deepPurple,))),
              const SizedBox(height: 50,),
              
        
            Form(
              key: _fonmKey,
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
                      obscureText: true,
                      decoration:const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                    
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
            roundedButton(title: 'Sign Up as User',
            loading: userloading,
            onTap: (){
              if(_fonmKey.currentState!.validate()){
                provider.setUser("User");
                userSignUp();
              }
            },),

            const SizedBox(height: 10,),

            roundedButton(title: 'Sign Up as Admin',
            loading: Adminloading,
            onTap: (){
              if(_fonmKey.currentState!.validate()){
                provider.setUser("Admin");
                adminSignup();
              }
            },),
        
            const SizedBox(height: 30,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
        
                TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const loginScreen()));
                },
                child: const Text("Login")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}