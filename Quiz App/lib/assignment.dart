import 'package:flutter/material.dart';

class assignment extends StatefulWidget{
  const assignment({super.key});

  @override
  State createState()=>_assignmentState();
}

class SingleQuestionModel{
  final String? question;
  final List<String>? options;
  final int? ansIndex;

  const SingleQuestionModel({this.question, this.options, this.ansIndex});
}

class _assignmentState extends State{
  List allQuestions=[
    
    const SingleQuestionModel(
    question:"Who is the founder of dart?",
    options:["A. James Gosling", "B. Bjarne Stroustrup", "C. Lars Bark and Kasper Lund", "D. Guido van Rossum"],
    ansIndex: 2,
    ),

     const SingleQuestionModel(
    question:"Null Safety in dart helps to prevent _ _ _ _ pointer exception",
    options:["A. Runtime", "B. Compiletime", "C. Memory", "D. Logical"],
    ansIndex: 1,
    ),

     const SingleQuestionModel(
    question:"Dart's null safety feature reduces the risk of _ _ _ _ errors",
    options:["A. Syntax", "B. Logical", "C. Type", "D. Null-related"],
    ansIndex: 3,
    ),


     const SingleQuestionModel(
    question:"What is the benefit of null safety in dart?",
    options:["A. It simplifies the syntax of dart code.", "B. It improves code performance.", "C. It reduces the risk of null pointer exception.", "D. It allows you to use null values without restriction."],
    ansIndex: 2,
    ),

     const SingleQuestionModel(
    question:"In dart which symbol is used to indicate that variable can hold null?",
    options:["A. !", "B. #", "C. &", "D. ?"],
    ansIndex: 3,
    ),
  ];


    bool questionscreen=true;
    int questionIndex=0;
    int selectedOption=-1;
    int score=0;

    MaterialStateProperty<Color?> buttonColor(int button){
      if(selectedOption!=-1){
        if(button==allQuestions[questionIndex].ansIndex){ 

           if(selectedOption==allQuestions[questionIndex].ansIndex){
                   score++;
           }

          return const MaterialStatePropertyAll(Colors.green);
          
        }
        else if(selectedOption!=allQuestions[questionIndex].ansIndex){
            if(selectedOption==button){
             return const MaterialStatePropertyAll(Colors.red);
            }
        }
        else{
          return const MaterialStatePropertyAll(Colors.white);
        }
      }
      
        return const MaterialStatePropertyAll(Colors.white);
      
    }

    void incrementQuestion(){
      setState(() {
        allQuestions[questionIndex++];

     

      if(questionIndex>allQuestions.length-1){
        questionscreen=false;
      }
      
      selectedOption=-1;
      });
      
    }
  
    Scaffold isQuestionScreen(){
      if(questionscreen==true){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            ),
          ),

          body: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                 const SizedBox(
                    child:  Text("Question: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),

                  SizedBox(
                    child: Text("${questionIndex+1}/${allQuestions.length}",
                    style:const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),

                ]
              ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                 
                    child: Text(allQuestions[questionIndex].question,
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    
                  ),

                   const SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    height:50,
                    width:350,

                    child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(selectedOption==-1){
                          selectedOption=0;
                        }
                      });
                    }, 
                    

                    style:  ButtonStyle(
                      backgroundColor:buttonColor(0),

                    shape:MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:const BorderSide(color:Colors.black45)
                  )
                  )
                    ),
                    
                    child: Text(allQuestions[questionIndex].options[0],
                    style:const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                      
                    ),
                    ),
                    

                    )
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                   SizedBox(
                    height:50,
                    width:350,

                    child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(selectedOption==-1){
                          selectedOption=1;
                        }
                      });
                    }, 

                    style:  ButtonStyle(
                      backgroundColor:buttonColor(1),

                    shape:MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side:const BorderSide(color:Colors.black45)
                  )
                  )
                    ),
                    child: Text(allQuestions[questionIndex].options[1],
                      style:const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                    ),

                    )
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                   SizedBox(
                    height:50,
                    width:350,

                    child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(selectedOption==-1){
                          selectedOption=2;
                        }
                      });
                    }, 

                    style:  ButtonStyle(
                      backgroundColor:buttonColor(2),

                    shape:MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:const BorderSide(color:Colors.black45)
                  )
                  )
                    ),
                    child: Text(allQuestions[questionIndex].options[2],
                      style:const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                    ),

                    )
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                   SizedBox(
                    height:50,
                    width:350,

                    child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(selectedOption==-1){
                          selectedOption=3;
                        }
                      });
                    }, 

                    style:  ButtonStyle(
                      backgroundColor:buttonColor(3),
                      
                    shape:MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:const BorderSide(color:Colors.black45),
                  )
                  )
                    ),
                    child: Text(allQuestions[questionIndex].options[3],
                      style:const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                    ),

                    )
                  ),

                  const SizedBox(
                    height: 20,
                  )
                
            
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              setState(() {
          
                if(selectedOption==-1){
                  
                    return;
                }
                else{
                    incrementQuestion();
                }
              });
            },
            child: const Icon(Icons.forward),
          ),

          backgroundColor: Colors.lightBlueAccent,
        );
      }
      else{
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(

                    height: 300,
                    width: 300,
                    child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/002/795/986/non_2x/gold-cup-winner-congratulations-background-illustration-free-vector.jpg",
                    ),
                  ),
                 
                ]
              ),

               const SizedBox(
                    height: 30,
                  ),

                  const SizedBox(
                    child:  Text("You have completed the Quiz!!!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   SizedBox(
                    child: Text("Score: $score/${allQuestions.length}",
                    style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                   ),

                   const SizedBox(
              height: 20,
            ),

             SizedBox(
              child:ElevatedButton(
                onPressed: (){
                  setState(() {
                    questionIndex=0;
                    questionIndex=0;
                    selectedOption=-1;
                    questionscreen=true;
                    score=0;
                  });
                }, 
                child: const Text("Refresh",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)),
            ),
                ],
              ),
              backgroundColor: Colors.lightBlueAccent,
        );
      }
    }

    @override
    Widget build(BuildContext context){
      return isQuestionScreen();
    }
}