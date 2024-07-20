
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetask/UI/splashScreen.dart';
import 'package:firebasetask/controller/job_details_provider.dart';
import 'package:firebasetask/controller/provider.dart';
import 'package:firebasetask/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create:(context) {
            return JobDetailsProvider();
          },
          ),

        ChangeNotifierProvider(
          create:(context) {
            return myProvider();
          },
          )
        
        ],
      
    child: MaterialApp(
      title:'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),

      home:const splashScreen(),
    )
    );
  }
}