import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:copy_cat/providers/opps_providers.dart';
import 'package:copy_cat/providers/strength_provider.dart';
import 'package:copy_cat/providers/threats_providers.dart';
import 'package:copy_cat/providers/weakness_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

class TableWidget extends StatefulWidget{
  
  final int swotID;
  TableWidget(this.swotID);
  @override 
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget>{
    static GlobalKey previewContainer = new GlobalKey();

  
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
        onPressed: TakeScreenShot,
        ),
        ]
      ),
      body: RepaintBoundary(
        key: previewContainer,
        child: SingleChildScrollView(
        padding: EdgeInsets.all( 10),
        child: Container(
          color: Colors.white,
          child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text("The SWOT Analysis",  style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                  ],),
          Table(
          border: TableBorder.all(),
          children: <TableRow>[
            TableRow(children: <Widget> [
             Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
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
                   color: Colors.white,
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
          color: Colors.white,
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
                   color: Colors.white,
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
          color: Colors.white,
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
                ],
                ),
      ),
        ],)
   ),
   ),
   ),
   );
  }
   Future<Uint8List> TakeScreenShot() async{
      try {
    print('inside');
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);

      var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List(),
      );
      print(filePath);
      // print(pngBytes);
      // print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
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
