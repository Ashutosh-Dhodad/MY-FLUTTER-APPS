import 'package:firebasetask/UI/Auth/loginScreen.dart';
import 'package:firebasetask/UI/posts/Admin/adminPostedJobs.dart';
import 'package:firebasetask/UI/posts/Users/userScreen.dart';
import 'package:firebasetask/controller/provider.dart';
import 'package:firebasetask/firebaseServices/authService.dart';
import 'package:firebasetask/firebaseServices/splashServices.dart';
import 'package:firebasetask/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  splashServices spScreen = splashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: AuthService().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          if(user.role == 'admin'){
            Provider.of<myProvider>(context, listen: false).setUser("Admin");
          }else{
            Provider.of<myProvider>(context, listen: false).setUser("User");
          }

          if (user.role == 'admin') {
            return JobManagement();
          } else {
            return userScreen();
          } 
        } else {
          return loginScreen();
        }
      },
    );
  }
}