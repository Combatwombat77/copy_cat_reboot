import 'dart:convert';
import 'dart:typed_data';
import 'package:copy_cat/models/db2.dart';
import 'package:copy_cat/providers/swot_provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SWOTSummary extends StatefulWidget {
  final int modelID;

  SWOTSummary(this.modelID);
  @override
  SWOTSummaryState createState() => SWOTSummaryState();
}

class SWOTSummaryState extends State<SWOTSummary> {
  static GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return //WillPopScope(
        // onWillPop: _onBackPressed,
        // child:
        Scaffold(
      appBar: AppBar(
        title: Text("SWOT ANALYSIS Preview "),
         flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
         actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: TakeScreenShot,
        ),
      ]),
      body: RepaintBoundary(
          key: previewContainer,
          child: Container(
              color: Colors.white,
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Table(border: TableBorder.all(), children: [
                         TableRow(children: [
                          Text("Strengths",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                          Text("Weaknesses",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ]),
                        TableRow(children: [
                          Container(
                            color: Colors.white,
                            height: 30,
                            // width: ,
                            child: FutureBuilder(
                              future: DBManagerSWOT.getLists(
                                  "one", widget.modelID),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  final notes = snapshot.data;
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                        },
                                        child: Card(
                                          elevation: 5.0,
                                          color: Colors.lightBlueAccent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CanvasTitle(
                                                  notes[index]['answer']),
                                              Container(
                                                height: 4,
                                              ),
                                              // _NoteDescription(notes[index]['description'])
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: notes == null ? 0 : notes.length,
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 150,
                            // width: ,
                            child: FutureBuilder(
                              future: DBManagerSWOT.getLists(
                                  "two", widget.modelID),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CanvasTitle(
                                                  notes[index]['answer']),
                                              Container(
                                                height: 4,
                                              ),
                                              // _NoteDescription(notes[index]['description'])
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: notes == null ? 0 : notes.length,
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text("Opportunities",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                          Text("Threats",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ]),
                        TableRow(children: [
                          Container(
                            color: Colors.white,
                            height: 150,
                            // width: ,
                            child: FutureBuilder(
                              future: DBManagerSWOT.getLists(
                                  "three", widget.modelID),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  final notes = snapshot.data;
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                        },
                                        child: Card(
                                          elevation: 5.0,
                                          color: Colors.pink,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CanvasTitle(
                                                  notes[index]['answer']),
                                              Container(
                                                height: 4,
                                              ),
                                              // _NoteDescription(notes[index]['description'])
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: notes == null ? 0 : notes.length,
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 150,
                            // width: ,
                            child: FutureBuilder(
                              future: DBManagerSWOT.getLists(
                                  "four", widget.modelID),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  final notes = snapshot.data;
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                        },
                                        child: Card(
                                          elevation: 5.0,
                                          color: Colors.grey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CanvasTitle(
                                                  notes[index]['answer']),
                                              Container(
                                                height: 4,
                                              ),
                                              // _NoteDescription(notes[index]['description'])
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: notes == null ? 0 : notes.length,
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ]),
                      ]),
                    )
                  ]))
          //)
          ),
    );
  }

  Future<Uint8List> TakeScreenShot() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
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

class CanvasTitle extends StatelessWidget {
  final String _title;

  CanvasTitle(this._title);

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
