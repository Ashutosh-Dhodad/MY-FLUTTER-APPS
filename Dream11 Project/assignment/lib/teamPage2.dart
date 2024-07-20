import 'package:assignment/database_binding.dart';
import 'package:assignment/finalTeam.dart';
import 'package:flutter/material.dart';



class teamPage2 extends StatefulWidget {
  const teamPage2({super.key});

  State createState() => _teamPage2State();
}

class _teamPage2State extends State {
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: SizedBox(
              child: Text(
                "CSK Elected to bat first",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 65),
                height: 45,
                width: 45,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqB_CgcjtC0KnZ5ez1filIk1wSnVKq5RgLtC1Uq1gVAg&s"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 12),
                child: const Text(
                  "CSK",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Text(
                  "RCB",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 8, right: 65),
                height: 35,
                width: 40,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9h2lNzfi3G4FA95WD6wdiWRVs_kiqTYc6GLZBWRRXhw&s"),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      margin: const EdgeInsets.only(top: 10, left: 100),
                      child: const Text(
                        "Select the RCB Players",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(),
                    Container(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS40k3bdtsjDFvRxcNrGtunuxHz9q0S7WFUjIadIaM1xw&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Virat Kohli",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 99.99%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 82, 105)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played last match",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 46, 85, 115)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj4=player(jerno: 18, name: "Virat Kohli");
                                  await insertplayerdata(obj4);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child:
                                  const Icon(Icons.add, color: Colors.green)),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXnKBxE0uqPgiqRC6abSdURxpadnv-0WROS1l7BLOOiw&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Faf Du Plessis",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 95.64%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 82, 105)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played Last Match",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 46, 85, 115)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj3=player(jerno: 13, name: "Faf Duplesis");
                                  await insertplayerdata(obj3);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.iplbetonline.in/wp-content/uploads/2023/04/3082-780x780.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Wanindu Hasaranga",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 35.99%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 46, 85, 115),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played Last Match",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 46, 85, 115),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 27,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj7=player(jerno: 200, name: "Wanindu Hasaranga");
                                  await insertplayerdata(obj7);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),


                   const Divider(),


                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIU5XLIaQu5TL_5vN70F99qhCKQNU3onmGVuLLVdDI6A&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Glen Maxwell",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 97.92%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 82, 105)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played Last Match",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 46, 85, 115)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj6=player(jerno: 32, name: "Glenn Maxwell");
                                  await insertplayerdata(obj6);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),


                    const Divider(),


                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://bcciplayerimages.s3.ap-south-1.amazonaws.com/playerheadshot/ipl/284/157.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Harshal Patel",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 19.31%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 155, 11, 11),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Not Available",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 155, 11, 11),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),

                    const Divider(),


                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 7),
                            height: 95,
                            width: 90,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHWYTb6JoGPgT0-RoRqiE-kZgU2bvSgd_kN9SKEicS1A&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Josh Hazelwood",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 3.31%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(

                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 155, 11, 11),),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Not Available",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 155, 11, 11),),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),

                    const Divider(),


                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 7),
                              height: 95,
                              width: 90,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIl12f8URcfiAl5RK3pCGH9L4a31-W40Is7zvQZRBqA&s")))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Dinesh Karthik",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 81.31%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 82, 105)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played Last Match",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 46, 85, 115)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() async{
                                  player obj1=player(jerno: 19, name: 'Dinesh Karthik');
                                  await insertplayerdata(obj1);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),

                     const Divider(),


                    SizedBox(
                      height: 80,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 7),
                              height: 95,
                              width: 90,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoUNew1d_vWTblSzdGWBj-phFZzY3s_XOXMj2LfDjjlQ&s")))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Mohammad Siraj",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 81.31%",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 117, 112, 112)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 54, 82, 105)),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    child: const Text(
                                      "Played Last Match",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromARGB(255, 46, 85, 115)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj9=player(jerno: 73, name: "Muhammad Siraj");
                                  await insertplayerdata(obj9);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.add, color: Colors.green))
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
      backgroundColor: Colors.black,

      floatingActionButton: FloatingActionButton(
        onPressed: (){
            setState(() {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>const finalTeam()));
          });
        },
        tooltip: 'next',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
