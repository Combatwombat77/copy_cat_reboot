import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableWidget extends StatefulWidget{
  @override 
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
               Navigator.pop(context);
        },
        ),
        title: Text('SWOT SUMMARY'),
        actions: <Widget>[
        IconButton(icon: Icon(Icons.save),
        onPressed: (){

        },
        ),
        ]
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all( 10),
        child: Table(
          border: TableBorder.all(),
          children: <TableRow>[
            TableRow(children: <Widget> [
              FittedBox( fit:BoxFit.contain,
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 50.0,
                height: 60.0,
                child: Column(
                  children:<Widget>[ 
                    Icon(Icons.thumb_up,
                    size: 6.0,
                    color: Colors.green,),
                  Text('Strengths',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 6.0),
                   ),
                  ],
              ),
              ),
              ),
              FittedBox(fit: BoxFit.contain,
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 50.0,
                height: 60.0,
                child: Column(children: <Widget>[
                  Icon(Icons.thumb_down,
                  size: 6.0,
                  color: Colors.red,),
                   Text(
                  'Weaknesses',
                  textAlign: TextAlign.left,
                  style: TextStyle( color: Colors.black,
                  fontSize:6.0),
                  ),
                ],
                ),
              ),
              ),  
            ],
            ),
            TableRow(children: <Widget> [
              FittedBox( fit:BoxFit.contain,
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 45.0,
                height: 60.0,
                child: Column(
                  children:<Widget>[
                    Icon(Icons.school,
                    size: 6.0,
                    color: Colors.blue,),
                     Text('Opportunities',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 6.0,
                   ),
                   ),
                  ]
              ),
              ),
              ),
              FittedBox(fit: BoxFit.contain,
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 50.0,
                height: 50.0,
                child: Column(
                  children: <Widget>[ 
                    Icon(Icons.warning,
                    size: 6.0,
                    color: Colors.orange,),
                Text('Threats',
                  textAlign: TextAlign.center,
                  style: TextStyle( color: Colors.black,
                  fontSize:6.0),
                  ),
                ],
                ),
              ),
            ),            
            ],
            ),
           ],
          ),
      ),
   );
  }
}   
