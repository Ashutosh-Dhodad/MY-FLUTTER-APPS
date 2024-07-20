
import 'package:flutter/material.dart';



class finalTeam extends StatefulWidget{

  const finalTeam({super.key});

  State createState()=>_finalTeamState();
}
List playerList=[];

class _finalTeamState extends State{


  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 140,
              ),
              Container(
                margin:const EdgeInsets.only(left: 20),
                child: const Text("My Team",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
              ),

              const Spacer(),

              GestureDetector(
                onTap: (){},
                child: const Icon(Icons.edit_outlined, color: Colors.white,),
              ),

              const SizedBox(
                width: 25,
              ),

              GestureDetector(
                onTap: (){},
                child: const Icon(Icons.share_outlined, color: Colors.white,),
              ),

              const SizedBox(
                width: 15,
              ),

              Container(
                margin:const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){},
                  child: const Icon(Icons.star_border_outlined, color: Colors.white,),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

                  Expanded(
                      child: Container(
                        width: 400,
                        decoration:const BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54SbsOfQS6A5yAVsQDbUtjv-Zur8zOXtZOzW0O9KmKA&s",),fit: BoxFit.cover)),
                        child: ListView.builder(
                          itemCount:1,
                          itemBuilder: (context, index) {
                            
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                               
                              
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                margin:const EdgeInsets.only(top: 5, left: 40),
                                child:const Icon(Icons.person, size: 50,),
                              ),
                                              
                              Container(
                                margin:const EdgeInsets.only(left: 45),
                               
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child:Text(
                                  playerList[index].name,
                                  style:const TextStyle(
                                  fontSize: 11,
                                ),
                                ),
                              )
                                    ],
                                  ),
                                              
                                  Column(
                                    children: [
                                      Container(
                                margin:const EdgeInsets.only(top: 5, left: 70),
                                child:const Icon(Icons.person, size: 50,),
                              ),
                                              
                              Container(
                                margin:const EdgeInsets.only(left: 75),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child:
                                Text(playerList[index+1].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),
                                ),
                              ),
                                    ],
                                  ),
                                              
                                              
                                ],
                              ),

                              const SizedBox(
                                  height: 60,
                                ),
                                    
                                              
                           
                              
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 10),
                                
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child: Text(playerList[index+2].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                    const Spacer(),
                                              
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 5, right: 5),
                               
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                 child: Text(playerList[index+3].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 30),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                Container(
                                margin:const EdgeInsets.only( right: 10),
                              
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                 child: Text(playerList[index+4].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(
                                  height: 60,
                                ),
                                    
                                              
                               
                                              
                                 Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 10),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                 child: Text(playerList[index+5].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                    const Spacer(),
                                              
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 5, right: 5),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child: Text(playerList[index+6].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 30),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 5, right: 5),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                              
                                child: Text(playerList[index+7].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(
                                  height: 70,
                                ),
                                              
                                
                                              
                                 Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 10),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child: Text(playerList[index+8].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                    const Spacer(),
                                              
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 35),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 5, right: 5),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child: Text(playerList[index+9].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    ),
                                              
                                     Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(top: 10, left: 30),
                                          child:const Icon(Icons.person, size: 50,),
                                        ),
                                              
                                        Container(
                                margin:const EdgeInsets.only(left: 5, right: 5),
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), color: Colors.white,),
                                child: Text(playerList[index+10].name,
                                style:const TextStyle(
                                  fontSize: 11,
                                ),),
                              ),
                                              
                                      ],
                                    )
                                  ],
                                )
                          
                          
                          
                            ]

                                                );
                          }
                        ),
                      )
     )
        ]
      ),
  
        
    
      backgroundColor: const Color.fromARGB(255, 67, 63, 63),
    );
    
  }
}