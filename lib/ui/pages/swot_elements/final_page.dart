import 'package:flutter/material.dart';

class FinalSwotGrid extends StatelessWidget{

  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('SWOT SUMMERY'),
        actions: <Widget>[
          
        ],
      ),
      body: OrientationBuilder(builder: (context, orientaion){

                return GridView.count(     
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: Container(
                      
                  child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Strengths'),
                 ]),),),),
          Card(
            color: Colors.white,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.white,
               onTap: (){
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Weaknesses'),

                 ]),),),),
          Card(
            color: Colors.white,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.blueAccent,
               onTap: (){
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Opportunities'),

                 ]),),),),         
          Card(
            color: Colors.white,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.purpleAccent,
               onTap: (){
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Threats'),

                 ]),),),),
               ],
      );
      },
      ),
      );
      }
  }