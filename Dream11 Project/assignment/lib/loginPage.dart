import 'package:assignment/mainPage.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  State createState()=>_loginPageState();
}

class _loginPageState extends State{
  
  bool _isAbove18=false;
  int mobNO=8788243121;
  final TextEditingController _phoneNoController=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 17, 7),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
            ), Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
                 Form(
                  key: _formKey,
                  child:  const Column(
                    children: [
                      Text(
                        "Login/Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Let's get you started",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.help),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          
          Expanded(
            child: Container(
              height: 500,
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 40, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 70,
                      child: TextFormField(
                    
                        controller: _phoneNoController,
                        decoration:const InputDecoration(
                          hintText: "Mobile Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                        validator:(value) {
                          if(value == null || value.isEmpty){
                            return "Phone Number is required";
                            }else{
                            return null;
                            }
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                      Row(
                      children: [
                       Checkbox(
                        value: _isAbove18,
                        onChanged:(value) {
                         setState(() {
                           _isAbove18=value ?? false;
                         });
                       },
                       ),

                        const SizedBox(
                          width: 5,
                        ),

                        const SizedBox(
                          child: Text("I certify that I am above 18 years"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(_phoneNoController.text=='9322129324' && _isAbove18){
                        setState(() {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const mainPage()));
                       });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                     
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Text("By continuing, I agree to Dream11's T&C")
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Have an Invite Code",
                          style: TextStyle(fontSize: 15, color: Colors.amber),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          child: Text("|"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Other login options",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
     
    );
  }
}