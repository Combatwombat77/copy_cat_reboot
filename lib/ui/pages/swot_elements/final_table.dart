import 'package:copy_cat/providers/opps_providers.dart';
import 'package:copy_cat/providers/strength_provider.dart';
import 'package:copy_cat/providers/threats_providers.dart';
import 'package:copy_cat/providers/weakness_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableWidget extends StatefulWidget{
  final int swotID;
  TableWidget(this.swotID);
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
        child: Center(
          child:Table(
          border: TableBorder.all(),
          children: <TableRow>[
            TableRow(children: <Widget> [
             Container(
                margin: EdgeInsets.all(2),
                width: 50.0,
                height: 60.0,
                child: Column(
                  children:<Widget>[ 
                    Icon(Icons.thumb_up,
                    size: 20.0,
                    color: Colors.green,),
                  Text('Strengths',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 20.0),
                   ),
                  
                  ],
              ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 50.0,
                height: 60.0,
                child: Column(children: <Widget>[
                  Icon(Icons.thumb_down,
                  size: 20.0,
                  color: Colors.red,),
                   Text(
                  'Weaknesses',
                  textAlign: TextAlign.left,
                  style: TextStyle( color: Colors.black,
                  fontSize:20.0),
                  ),
                ],
                ),
              ),
               
            ],
            ),

            TableRow(
              children: [
                 Container(
                   height: 150,
                   child: FutureBuilder(
                                  future: StrengthProvider.getStrengthList(widget.swotID.toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.green,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      SwotTitle(notes[index]['title']),
                                                      Container(height: 4,),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                 
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),),

      Container(
          height: 150,
          child: FutureBuilder(
                    future: WeakProvider.getWeakList(widget.swotID.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final notes = snapshot.data;
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                },
                                child: Card(
                                  elevation: 5.0,
                                  color: Colors.yellow,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SwotTitle(notes[index]['title']),
                                        Container(height: 4,),
                                        // _NoteDescription(notes[index]['description'])
                                      ],
                                    ),
                                  ),
                 
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),),
              ]
            ),


            TableRow(children: <Widget> [
              Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 45.0,
                height: 60.0,
                child: Column(
                  children:<Widget>[
                    Icon(Icons.school,
                    size: 20.0,
                    color: Colors.blue,),
                     Text('Opportunities',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 20.0,
                   ),
                   ),
                  ]
              ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                width: 50.0,
                height: 50.0,
                child: Column(
                  children: <Widget>[ 
                    Icon(Icons.warning,
                    size: 20.0,
                    color: Colors.orange,),
                Text('Threats',
                  textAlign: TextAlign.center,
                  style: TextStyle( color: Colors.black,
                  fontSize:20.0),
                  ),
                ],
                ),
              ),           
            ],
            ),
            TableRow(
              children: [
                 Container(
                   height: 150,
                   child: FutureBuilder(
                                  future: OppsProvider.getOppsList(widget.swotID.toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.lightBlue,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      SwotTitle(notes[index]['title']),
                                                      Container(height: 4,),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                 
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),),

      Container(
          height: 150,
          child: FutureBuilder(
                    future: ThreatProvider.getThreatList(widget.swotID.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final notes = snapshot.data;
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                },
                                child: Card(
                                  elevation: 5.0,
                                  color: Colors.purple,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SwotTitle(notes[index]['title']),
                                        Container(height: 4,),
                                        // _NoteDescription(notes[index]['description'])
                                      ],
                                    ),
                                  ),
                 
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),),
              ]
            ),
           ],
          ),
      ),
      )
   );
  }
}   

class SwotTitle extends StatelessWidget {
  final String _title;

  SwotTitle(this._title);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      // style: TextStyle(
      //   fontWeight: FontWeight.bold
      // ),
    );
  }
}

