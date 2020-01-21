
import 'package:copy_cat/ui/pages/swot_elements/opportunities_elements/opp_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/strengths_elements/views/strengths_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/threats_elements/threats_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/weakness_elements/w_views/weak_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../dashboard.dart';


class SwotGrid extends StatelessWidget{
  
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard())
            );
          },
        ),
        title: Text('SWOT ANALYSIS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
              },
          )
        ],
      ),
      body: OrientationBuilder(builder: (context, orientaion){
        int _counter = 0;
        int _counter2 = 0;
        int _counter3 = 0;
        int _counter4 = 0;
                return GridView.count(     
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    elevation: 5.0,
                    color: Colors.green,
                    child: Container(
                      
                  child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => NoteList()));
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Strengths'),
                             Text(
                      '$_counter',
              style: Theme.of(context).textTheme.display1,)
               
                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.yellow,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.yellowAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => WeakList()));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Weaknesses'),
                             Text(
                      '$_counter2',
              style: Theme.of(context).textTheme.display1,)
                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.blue,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.blueAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => OppsList()));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Opportunities'),
                             Text(
                      '$_counter3',
              style: Theme.of(context).textTheme.display1,)
                 ]),),),),         
          Card(
            elevation: 5.0,
            color: Colors.purple,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.purpleAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ThreatList()));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Threats'),
                             Text(
                      '$_counter4',
              style: Theme.of(context).textTheme.display1,)
                 ]),),),),
               ],
      );
      },
      ),
      ),
      );
      }
  }

 