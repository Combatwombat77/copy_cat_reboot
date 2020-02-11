import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Guiding extends StatefulWidget {
  @override
  _GuidingState createState() => _GuidingState();
}

class _GuidingState extends State<Guiding> with SingleTickerProviderStateMixin {

  TabController inAppTabController;


   @override
  void initState(){
    super.initState();
    inAppTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    inAppTabController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guiding Questions"),
        centerTitle: true,
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Challenge Mapping"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Impact Gaps"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Solutions Mapping"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          Challenges(),
          ImpactGap(),
          Solutions()
        ],
      ),
    );
  }
}



class ImpactGap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Card(
            // height: 200,
            // width: 250.0,
            // color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.3,
              child: Text("Q: What is missing that could close the gap between the challenge and the current solutions, where are opportunities for greater collective impact and what are the key lessons learned?"),),
          ),
          Divider(
            color: Colors.black,
          ),
          Text("Guiding Questions",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 23.0),),

            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              // color:  Colors.grey,
              child: Column(
                children: <Widget>[
                  Text(
                    "WHERE ARE THE GAPS BETWEEN THE CHALLENGE AND SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                     DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "Who or what is not being served and what is missing to bridge that gap? What actions can be taken to fill the gaps?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      Text(
                    "WHERE ARE THE GAPS WITHIN THE SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is missing(specific regulations, knowledge sharing, new efforts, partnerships, etc) that would further link up the solutions and achieve greater impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),
                      Text(
                    "WHERE ARE THE UNADDRESSED OBSTACLES?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is being overlooked? What are the unintended negative consequences of the existing efforts? What specific key opportunities could unlock future impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),

                    Text(
                    "WHAT ARE THE KEY LESSONS LEARNED?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "From your research and interviews, what key lessons could you share with anyone who wants to impact change in this sector? Where are the biggest opportunities for impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          

                     
                ],
              ),
            ),

        ],),)
      )
      );
  }
}

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Card(
            // color: Colors.blue,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
            child: Text("What's happening, what's the impact of the challenge, and what's holding the challenge in place?"),
          ),),
           Divider(
            color: Colors.black,
          ),
          Text("Guiding Questions", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 23.0),),
          Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              // color:  Colors.grey,
              child: Column(
                children: <Widget>[
                  Text(
                    "WHERE ARE THE GAPS BETWEEN THE CHALLENGE AND SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                     DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "Who or what is not being served and what is missing to bridge that gap? What actions can be taken to fill the gaps?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      Text(
                    "WHERE ARE THE GAPS WITHIN THE SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is missing(specific regulations, knowledge sharing, new efforts, partnerships, etc) that would further link up the solutions and achieve greater impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),
                      Text(
                    "WHERE ARE THE UNADDRESSED OBSTACLES?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is being overlooked? What are the unintended negative consequences of the existing efforts? What specific key opportunities could unlock future impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),

                    Text(
                    "WHAT ARE THE KEY LESSONS LEARNED?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "From your research and interviews, what key lessons could you share with anyone who wants to impact change in this sector? Where are the biggest opportunities for impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          

                     
                ],
              ),
            ),
        ],),)
      )
      );
  }
}

class Solutions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
            // color: Colors.blue,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
            child: Text("What models are already being tried, what's working, what's not, and what resources are available?"),
          ),),
           Divider(
            color: Colors.black,
          ),
          Text("Guiding Questions",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 23.0),),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              // color:  Colors.grey,
              child: Column(
                children: <Widget>[
                  Text(
                    "WHERE ARE THE GAPS BETWEEN THE CHALLENGE AND SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                     DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "Who or what is not being served and what is missing to bridge that gap? What actions can be taken to fill the gaps?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      Text(
                    "WHERE ARE THE GAPS WITHIN THE SOLUTIONS?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is missing(specific regulations, knowledge sharing, new efforts, partnerships, etc) that would further link up the solutions and achieve greater impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),
                      Text(
                    "WHERE ARE THE UNADDRESSED OBSTACLES?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "What is being overlooked? What are the unintended negative consequences of the existing efforts? What specific key opportunities could unlock future impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,),

                    Text(
                    "WHAT ARE THE KEY LESSONS LEARNED?",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                     ),),
                      DottedBorder(
                       child: Container(
                         color: Colors.grey.shade700,
                       width:  MediaQuery.of(context).size.width / 1.3,
                      child:   Padding( 
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                        "From your research and interviews, what key lessons could you share with anyone who wants to impact change in this sector? Where are the biggest opportunities for impact?",
                        style: TextStyle(color: Colors.white),
                        ),
                        )),
                      ), 
                      Padding( 
                          padding: const EdgeInsets.all(5.0),),
                          

                     
                ],
              ),
            ),

          
        ],),)
      )
      );
  }
}