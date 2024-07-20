import 'package:flutter/material.dart';
import 'database_binding.dart';
import 'teamPage2.dart';

class teamPage1 extends StatefulWidget {
  const teamPage1({super.key});

  State createState() => teamPage1State();
}

class teamPage1State extends State {
List <player> Playerslist = [];



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
                        "Select the CSK Players",
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
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAcHBIRXI28gjCRVIzMiLmM3XvaFcEL3Yl20hGZ-fsgA&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "MS Dhoni",
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
                              onPressed: (){
                                setState(()async {
                                  player obj0=player(jerno: 7, name: "MS DHONI");
                                  await insertplayerdata(obj0);
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
                                        "https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/IPLHeadshot2023/102.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Ruturaj gaikwad",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 77.64%",
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
                            width: 55,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj2=player(jerno: 31, name: "Ruturaj Gaikwad");
                                  await insertplayerdata(obj2);
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
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeLWzjqxx8bzKsQC9e1H_OD-t_UgXsBAu03Q&usqp=CAU"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Matheesha Pathirana",
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
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                
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
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJG3FDrHrnLPRF0DQ-yk61T4uMkUjwXEFoTYX7kGxOMg&s"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Devon Conway",
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
                                  player obj3=player(jerno: 88, name: "Devon Conway");
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
                                        "https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/IPLHeadshot2023/539.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Tushar Deshpande",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 2, left: 5),
                                child: const Text(
                                  "Sel by 70.31%",
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
                            width: 39,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                 setState(()async {
                                  player obj10=player(jerno: 24, name: "Tushar Deshpande");
                                  await insertplayerdata(obj10);
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
                                        "https://bcciplayerimages.s3.ap-south-1.amazonaws.com/playerheadshot/ipl/284/3746.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Lungi Ngidi",
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
                            width: 90,
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
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3bwNn07dEuTOvGSsIrIKRatgsn8OHzuN7l2flAF5syw&s")))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Dipak Chahar",
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
                            width: 70,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj8=player(jerno: 90, name: "Dipak Chahar");
                                  await insertplayerdata(obj8);
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
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQM7_HZ02X-Zz3QcWtrqdYPDVjeXXteb1I9XOIdKdpTA&s")))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  "Ravindra Jadeja",
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
                            width: 17,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(()async {
                                  player obj5=player(jerno: 8, name: "Ravindra Jadeja");
                                  await insertplayerdata(obj5);
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
            MaterialPageRoute(builder: (context)=>const teamPage2()));
          });
           
        },
        tooltip: 'next',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
