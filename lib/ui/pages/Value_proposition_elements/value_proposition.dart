import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/products_and_services/products&services_list.dart';

class Value extends StatefulWidget{
  
  @override 

  ValueState createState() => ValueState();

}

class ValueState extends  State<Value>{

Material myItems(IconData icon, String heading, int color){
  return Material(
    color: Colors.blue,
    elevation: 14.0,
    shadowColor: Colors.black,
    borderRadius: BorderRadius.circular(24.0),
    child: Center( 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading,
                       style: TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                  ),
                 ),
                ),
                ),

               Material(
                color: new Color(color),
                borderRadius: BorderRadius.circular(24.0),
                  child: Padding(
                   padding: const EdgeInsets.all(16.0),
                    child: Icon (icon,
                    color: Colors.black,
                    size: 30.0,
                    ),
                    ),  
                   ),          
              ],
            )          
          ],
         ),
        ),
       ),
  );
}

@override 
Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Value Proposition Canvas'),

      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
           //Navigator.push(context, MaterialPageRoute(builder: (context) => TableWidget(swotID)));
        },
        child: Icon(Icons.exit_to_app),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
        children: <Widget>[
          Card(
                    elevation: 5.0,
                    color: Colors.blue,
                    child: Container(               
                     child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => NotesList()));
                       },             
                       child:Column(
                         children: <Widget>[
                           Text('Products and Services',
                           style: TextStyle(
                             fontSize: 30,
                             color: Colors.white
                           ),),
                           Icon(Icons.graphic_eq,
                           size: 40.0,)
                 ]),),),),
                 Card(
                    elevation: 5.0,
                    color: Colors.blue,
                    child: Container(
                      
                  child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => NotesList()));
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Gain Creators',
                           style: TextStyle(
                             fontSize: 25,
                             color: Colors.white
                           ),),
                           Icon(Icons.attach_money,
                           size: 40.0,)
                 ]),),),),
                 Card(
                    elevation: 5.0,
                    color: Colors.blue,
                    child: Container(
                      
                  child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => NoteList(swotID.toString())));
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Pain Relievers',
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.white,
                           ),),
                           Icon(Icons.spa,
                           size: 40.0,)
                 ]),),),),
                 Card(
                    elevation: 5.0,
                    color: Colors.blue,
                    child: Container(
                      
                  child:
                       InkWell(splashColor: Colors.greenAccent,
                       onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => NoteList(swotID.toString())));
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Customers',
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.white
                           ),),
                           Icon(Icons.supervised_user_circle,
                           size: 40.0,)
                 ]),),),),
                 
                 

                 


          
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 210.0),
        ]
        ,
        ),

    );
}

}