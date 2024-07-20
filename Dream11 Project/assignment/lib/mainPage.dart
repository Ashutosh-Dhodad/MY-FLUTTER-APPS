
import 'package:assignment/database_binding.dart';
import 'package:flutter/material.dart';
import 'teamPage1.dart';
import 'finalTeam.dart';


class mainPage extends StatefulWidget{

  const mainPage({super.key});

  State createState()=>_mainPageState();
}

class _mainPageState extends State{

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      await createDatabase();
    
      playerList=await getplayerdata();
    
    
      setState(() {});
    });
  }

  bool isPressedCreateTeam1=false;
  bool isPressedCreateTeam2=false;
  bool isPressedCreateTeam3=false;
  bool isPressedCreateTeam4=false;
  bool isPressedCreateTeam5=false;

  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                height: 30,
                width: 30,
                decoration:const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage("https://www.herofincorp.com/public/web/img/Person-icon-min.webp"))),
              ),

              Container(
                margin: const EdgeInsets.only(top: 60, right: 5),
                height: 40,
                width: 100,
                
                child: const Text("DREAM 11",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),),
              ),

              Container(
                height: 50,
                width: 60,
                margin:const EdgeInsets.only(top: 50, right: 5),
                decoration:const BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNTHmucUiRCANU1EENEq9c277CGA7OwvxFUWcdOcGqYg&s")), shape: BoxShape.circle),
              ),

              Container(
                margin:const EdgeInsets.only(top: 50, left: 55, right: 5),
                child: const Icon(Icons.notifications_outlined, color: Colors.white,),
              ),

              Container(
                padding:const EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration:const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(179, 216, 212, 212)),
                margin:const EdgeInsets.only(top: 50, left: 5, right: 5),
                child: const Icon(Icons.account_balance_wallet_outlined, color: Colors.white,),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
             
                    ElevatedButton(
                        onPressed: (){},
                        
                        style: ElevatedButton.styleFrom(shape:const CircleBorder()),
                        child: const Icon(Icons.sports_cricket_rounded,  color: Color.fromARGB(255, 69, 64, 64),),
                        ),
                  

                 Container(
                 margin:const EdgeInsets.only(left: 12, top: 5),
                   child: const Text("CRICKET",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                 )
                ],
              ),

              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    
                    margin:const EdgeInsets.only(top: 25, left: 20),
                    child: const Icon(Icons.sports_soccer_rounded, color: Color.fromARGB(255, 162, 151, 151),),
                  ),

                 Container(
                 margin:const EdgeInsets.only(left: 18, top: 5),
                   child: const Text("Football",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 162, 151, 151)
                    ),),
                 )
                ],
              ),

              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                  
                    margin:const EdgeInsets.only(top: 25, left: 20),
                    child: const Icon(Icons.sports_kabaddi_outlined, color:Color.fromARGB(255, 162, 151, 151)),
                  ),

                 Container(
                 margin:const EdgeInsets.only(left: 18, top: 5),
                   child: const Text("Kabaddi",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 162, 151, 151)
                    ),),
                 )
                ],
              ),

              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:const BoxDecoration(shape: BoxShape.circle),
                    margin:const EdgeInsets.only(top: 25, left: 20),
                    child: const Icon(Icons.sports_basketball_outlined, color: Color.fromARGB(255, 162, 151, 151),),
                  ),

                 Container(
                 margin:const EdgeInsets.only(left: 18, top: 5),
                   child: const Text("Basketball",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 162, 151, 151)
                    ),),
                 )
                ],
              ),

              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:const BoxDecoration(shape: BoxShape.circle),
                    margin:const EdgeInsets.only(top: 25, left: 20),
                    child: const Icon(Icons.sports_esports_outlined, color: Color.fromARGB(255, 162, 151, 151),),
                  ),

                 Container(
                 margin:const EdgeInsets.only(left: 18, top: 5),
                   child: const Text("E-sport",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 162, 151, 151)
                    ),),
                 )
                ],
              ),

            ],
          ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin:const EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                    
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle, image:const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6N0vVwX-kUTQHwdok6f7zNjTx7P_GlLwfcvlb4VEacg&s"),), border: Border.all(color: const Color.fromARGB(255, 155, 11, 11), width: 3)),
                            ),
                        
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 100,
                              
                              decoration: BoxDecoration(shape: BoxShape.circle, image:const DecorationImage(image: NetworkImage("https://www.fancode.com/skillup-uploads/fc-web-logo/fc-logo-orange-block-bg.png"),fit: BoxFit.fill), border: Border.all(color: const Color.fromARGB(255, 155, 11, 11), width: 3)),
                            ),
                        
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 100,
                              
                              decoration: BoxDecoration(shape: BoxShape.circle, image:const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBpIPI2aBR4-W11Me4RuxwzXU_cQAvndj9AqBtar9vA&s"),fit: BoxFit.fill), border: Border.all(color: const Color.fromARGB(255, 155, 11, 11), width: 3)),
                            ),
                        
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 100,
                              
                              decoration: BoxDecoration(shape: BoxShape.circle, image:const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsB37VINhZlA7PVYKUc60wnP8ut_OrcKVYvWuGswLFoA&s"),fit: BoxFit.fill), border: Border.all(color: const Color.fromARGB(255, 155, 11, 11), width: 3)),
                            ),
                        
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 70,
                              width: 100,
                              
                              decoration: BoxDecoration(shape: BoxShape.circle, image:const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZnb90wRSO4mUqVYBBO0s_0cTTd893KaHyXxU2pgFJoA&s"),fit: BoxFit.fill), border: Border.all(color: const Color.fromARGB(255, 155, 11, 11), width: 3)),
                            )
                          ],
                        ),
                      ),
                
                      Container(
                        margin:const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                        child: const Text("Upcoming Matches",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                
                    
                       Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 171, 167, 167)), borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only( left: 10, top: 10),
                                    child: const Text("Pro Mode: Indian Premier League...",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                        
                        
                                  Container(
                                    margin: const EdgeInsets.only(left: 40, right: 8, top: 10),
                                    child: const Text("Lineups Out",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.green
                                    ),),
                                  ),
                        
                                ],
                              ),
                        
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 10),
                                    height: 45,
                                    width: 45,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqB_CgcjtC0KnZ5ez1filIk1wSnVKq5RgLtC1Uq1gVAg&s"),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(left: 8, top: 12),
                                    child: const Text("CSK",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15),
                                    child: const Text("RCB",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 8, right: 10),
                                    height: 35,
                                    width: 40,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9h2lNzfi3G4FA95WD6wdiWRVs_kiqTYc6GLZBWRRXhw&s"),
                                  ),
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(left: 18),
                                    child: const Text("Chennai Super Kings",
                                    style: TextStyle(
                                      fontSize: 10,
                                  
                                    ),),
                                  ),
                        
                                 const Spacer(),
                        
                                  Container(
                                margin:const EdgeInsets.only(left: 18, right: 10),
                                child: const Text("Royal Challengers Bangalore",
                                style: TextStyle(
                                  fontSize: 10,
                        
                                ),),
                              )
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    padding:const EdgeInsets.all(5),
                                    margin:const EdgeInsets.only(top: 12, left: 15),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 241, 223, 198))),
                                    child: const Text("MEGA 50 Lakhs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 211, 142, 38)
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    height: 30,
                                    width: 150,
                                    margin:const EdgeInsets.only(top: 12, right: 15),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(
                                      onPressed:(){
                                        setState(() {
                                          isPressedCreateTeam1=true;
                                          if(isPressedCreateTeam1==true){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>const teamPage1()),
                                );
                        
                                          }
                                        });
                                      },
                                      child: const Text("Create Team",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 162, 151, 151)
                                      ),)),
                                  )
                                ],
                              )
                              
                               
                            ],
                          ),
                        ),
                
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 171, 167, 167)), borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only( left: 10, top: 10),
                                    child: const Text("Pro Mode: Indian Premier League...",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                        
                        
                                ],
                              ),
                        
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 10),
                                    height: 45,
                                    width: 45,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN-xSN8Nf2h3uH86SlxuJ0TfUQlaW-ZtwYCe4lJv9Csg&s"),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(left: 8, top: 12),
                                    child: const Text("MI",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15),
                                    child: const Text("GT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 8, right: 10),
                                    height: 35,
                                    width: 40,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/0/09/Gujarat_Titans_Logo.svg/800px-Gujarat_Titans_Logo.svg.png"),
                                  ),
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(left: 18),
                                    child: const Text("Mumbai Indians",
                                    style: TextStyle(
                                      fontSize: 10,
                                  
                                    ),),
                                  ),
                        
                                 const Spacer(),
                        
                                  Container(
                                margin:const EdgeInsets.only(left: 18, right: 10),
                                child: const Text("Gujarat Titans",
                                style: TextStyle(
                                  fontSize: 10,
                        
                                ),),
                              )
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    padding:const EdgeInsets.all(5),
                                    margin:const EdgeInsets.only(top: 12, left: 15),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 241, 223, 198))),
                                    child: const Text("MEGA 45 Lakhs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 211, 142, 38)
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    height: 30,
                                    width: 150,
                                    margin:const EdgeInsets.only(top: 12, right: 15),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(
                                      onPressed:(){
                                        setState(() {
                                         
                                          if(isPressedCreateTeam2==true){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>const teamPage1()),
                                );
                        
                                          }
                                        });
                                      },
                                      child: const Text("Create Team",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 162, 151, 151)
                                      ),)),
                                  )
                                ],
                              )
                              
                               
                            ],
                          ),
                        ),
                
                         Container(
                          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 171, 167, 167)), borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only( left: 10, top: 10),
                                    child: const Text("Pro Mode: Indian Premier League...",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                        
                        
                                ],
                              ),
                        
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 10),
                                    height: 45,
                                    width: 45,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Z8kugmm9mE8DBuHUkvWfo04QLR5OOVysLYl8x4CVqg&s"),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(left: 8, top: 12),
                                    child: const Text("KKR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15),
                                    child: const Text("DC",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 8, right: 10),
                                    height: 35,
                                    width: 40,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/2/2f/Delhi_Capitals.svg/1200px-Delhi_Capitals.svg.png"),
                                  ),
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(left: 18),
                                    child: const Text("Kolkata Knight Riders",
                                    style: TextStyle(
                                      fontSize: 10,
                                  
                                    ),),
                                  ),
                        
                                 const Spacer(),
                        
                                  Container(
                                margin:const EdgeInsets.only(left: 18, right: 10),
                                child: const Text("Delhi Capitals",
                                style: TextStyle(
                                  fontSize: 10,
                        
                                ),),
                              )
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    padding:const EdgeInsets.all(5),
                                    margin:const EdgeInsets.only(top: 12, left: 15),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 241, 223, 198))),
                                    child: const Text("MEGA 37 Lakhs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 211, 142, 38)
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    height: 30,
                                    width: 150,
                                    margin:const EdgeInsets.only(top: 12, right: 15),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(
                                      onPressed:(){
                                        setState(() {
                                       
                                          if(isPressedCreateTeam3==true){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>const teamPage1()),
                                );
                        
                                          }
                                        });
                                      },
                                      child: const Text("Create Team",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 162, 151, 151)
                                      ),)),
                                  )
                                ],
                              )
                              
                               
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 171, 167, 167)), borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only( left: 10, top: 10),
                                    child: const Text("Pro Mode: Indian Premier League...",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                        
                        
                                ],
                              ),
                        
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 10),
                                    height: 45,
                                    width: 45,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlBfwDW1ecCsZRAZpZyG1NJdKg1yvuVo5YW3FMqo5tGw&s"),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(left: 8, top: 12),
                                    child: const Text("SRH",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15),
                                    child: const Text("LSG",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 8, right: 10),
                                    height: 35,
                                    width: 40,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRefMK7XyKtgwZqFuy6Hk0hfXOUQSFsqRsB7JzZFb_1-A&s"),
                                  ),
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(left: 18),
                                    child: const Text("Sunrisers Haidrabad",
                                    style: TextStyle(
                                      fontSize: 10,
                                  
                                    ),),
                                  ),
                        
                                 const Spacer(),
                        
                                  Container(
                                margin:const EdgeInsets.only(left: 18, right: 10),
                                child: const Text("Lucknow Super Giants",
                                style: TextStyle(
                                  fontSize: 10,
                        
                                ),),
                              )
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    padding:const EdgeInsets.all(5),
                                    margin:const EdgeInsets.only(top: 12, left: 15),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 241, 223, 198))),
                                    child: const Text("MEGA 30 Lakhs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 211, 142, 38)
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    height: 30,
                                    width: 150,
                                    margin:const EdgeInsets.only(top: 12, right: 15),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(
                                      onPressed:(){
                                        setState(() {
                                       
                                          if(isPressedCreateTeam4==true){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>const teamPage1()),
                                         );
                        
                                          }
                                        });
                                      },
                                      child: const Text("Create Team",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 162, 151, 151)
                                      ),)),
                                  )
                                ],
                              )
                              
                               
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 171, 167, 167)), borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only( left: 10, top: 10),
                                    child: const Text("Pro Mode: Indian Premier League...",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                        
                        
                        
                                ],
                              ),
                        
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 10,),
                                    height: 45,
                                    width: 45,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqB_CgcjtC0KnZ5ez1filIk1wSnVKq5RgLtC1Uq1gVAg&s"),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(left: 8, top: 12),
                                    child: const Text("CSK",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15),
                                    child: const Text("MI",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                        
                                  Container(
                                    margin:const EdgeInsets.only(top: 15, left: 8, right: 10),
                                    height: 35,
                                    width: 40,
                                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN-xSN8Nf2h3uH86SlxuJ0TfUQlaW-ZtwYCe4lJv9Csg&s"),
                                  ),
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    margin:const EdgeInsets.only(left: 18),
                                    child: const Text("Chennai Super Kings",
                                    style: TextStyle(
                                      fontSize: 10,
                                  
                                    ),),
                                  ),
                        
                                 const Spacer(),
                        
                                  Container(
                                margin:const EdgeInsets.only(left: 18, right: 10),
                                child: const Text("Mumbai Indians",
                                style: TextStyle(
                                  fontSize: 10,
                        
                                ),),
                              )
                                ],
                              ),
                        
                              Row(
                                children: [
                                  Container(
                                    padding:const EdgeInsets.all(5),
                                    margin:const EdgeInsets.only(top: 12, left: 15),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 241, 223, 198))),
                                    child: const Text("MEGA 50 Lakhs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 211, 142, 38)
                                    ),),
                                  ),
                        
                                  const Spacer(),
                        
                                  Container(
                                    height: 30,
                                    width: 150,
                                    margin:const EdgeInsets.only(top: 12, right: 15),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(
                                      onPressed:(){
                                        setState(() {
                                         
                                          if(isPressedCreateTeam5==true){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>const teamPage1()),
                                );
                        
                                          }
                                        });
                                      },
                                      child: const Text("Create Team",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 162, 151, 151)
                                      ),)),
                                  )
                                ],
                              )
                              
                               
                            ],
                          ),
                        ),
                
                      
                      
                    ],
                  ),
                ),
              ),
            )
          
        ],
      ),

      backgroundColor:const Color.fromARGB(255, 155, 11, 11),
    );
  }
}