 import 'package:flutter/material.dart';
import 'assignment.dart';

class loginPage extends StatefulWidget{

  const loginPage({super.key});

  State createState()=>_loginPageState();
}

class _loginPageState extends State{

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController(); 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword=true;
  

  void clearTextField(){
    _userNameController.clear();
    _passWordController.clear();
  }

  List<Map<String, String>> userinfo=[
    {
    "username":"ashutosh",
    "password":"ashu@123",
    },

    {
    "username":"karan",
    "password":"karan@123",
    },
  ];
  

  bool validateDetails(){
    String usernamevalue=_userNameController.text;
    String passwordvalue=_passWordController.text;

    for(var credential in userinfo){
    if(credential["username"]==usernamevalue && credential["password"]==passwordvalue){
      return true;
      }
    }
    
    return false;
   }
    

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        ),
        backgroundColor:Colors.pink,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          height:760 ,
          decoration:const BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.pinimg.com/736x/65/06/a3/6506a3e63a3fb1e961cc2557e341e1d9.jpg"),
          fit: BoxFit.fill
          )),
          child: Center(
            
          child: Container(
              height: 600,
              width: 400,
              
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(50),
                color: Colors.black12,
                border: Border.all(color: Colors.black87, width: 2)
              ),
              child: Padding(
                padding:const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            
                      const SizedBox(
                        height: 20,
                      ),
        
                      Container(
                        decoration:const BoxDecoration(shape: BoxShape.circle,color: Colors.black38,),
                        
                      child:const Icon(Icons.person_outline_rounded,
                      size: 100,
                      )
                      ),
            
                      const SizedBox(
                        height: 50,
                      ),
            
                      TextFormField(
                        controller:_userNameController,
            
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          label: const Text("Enter Username",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:const BorderSide(color: Colors.black),
                          ),
            
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.black)
                          ),
            
                          prefixIcon:const Icon(Icons.person_outline_rounded,
                          color: Colors.black,),
                        ),
            
                        validator: (value) {
                         
                          if(value==null || value.isEmpty){
                            return "Please Enter Username";
                          }else{
                            return null;
                          }
                        },
            
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                      ),
            
                      const SizedBox(
                        height: 20,
                      ),
            
                      TextFormField(
                        controller:_passWordController,
                        obscureText: showPassword,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          label: const Text("Enter PassWord",
                          style: TextStyle(
                            color: Colors.black
                          ),
                          ),
        
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
            
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
            
                          prefixIcon: const Icon(Icons.lock,
                          color: Colors.black),
        
                          suffixIcon: IconButton(
                            icon:Icon(showPassword? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword=!showPassword;
                              });
                            },
                          ),
                        ),
            
                        validator: (value) {
                         
                          if(value==null || value.isEmpty){
                            return "Please Enter Password";
                          }else{
                            return null;
                          }
                        },
            
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                      ),
            
                      const SizedBox(
                        height: 40,
                      ),
        
                      SizedBox(
                      height: 50,
                      width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                          ),
                          onPressed:(){
                            bool loginValidated = _formKey.currentState!.validate();
                            bool showNextPage = false;
                      
                            
                            if(loginValidated && validateDetails()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:const Text("Login Successfull",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                  ),
                                  ),
                                  backgroundColor: Colors.green,
                                  duration:const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  width: 275,
                                  padding:const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                                ),
                              );
                              showNextPage=true;
                              clearTextField();
                              
                      
                            }else{
                               ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:const Text("Login Failed",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  
                                  ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration:const Duration(seconds:2),
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                                  
                                  
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  width: 275,
                                  padding:const EdgeInsets.only(left: 50, top: 10, bottom: 10)
                                  
                                ),
                              );
                            }
                            
                            if(showNextPage==true){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>const assignment()),
                            );
                          }
                          },
                          child: const Text("Login",
                          style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                          ),
                          ),
                      ),
                    ],
                  ),
                ),
                ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
