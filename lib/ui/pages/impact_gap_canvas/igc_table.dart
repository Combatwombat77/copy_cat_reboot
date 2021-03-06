import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:copy_cat/models/db2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:image_picker_saver/image_picker_saver.dart';


class IGCTable extends StatefulWidget {
    final int modelID;
    final String title;

  IGCTable(this.modelID,this.title);


  @override
  _IGCTableState createState() => _IGCTableState();
}

class _IGCTableState extends State<IGCTable> {

      static GlobalKey previewContainer = new GlobalKey();


  String questionString = "Hello World";
  double fontSizeR = 10.0;
  List<Map<String, dynamic>> list = [];


  @override
  void initState(){
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IGC Preview"),
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
            onPressed: ()=> TakeScreenShot2(),
          ),
                      IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
        ],
      ),
      body: RepaintBoundary(
        key: previewContainer,
        child:SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                    child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[                           
                              ],         
                          ),
              Row(children: <Widget>[
                Expanded(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 280.0,
                            child: Row(
                              children: <Widget>[
                                Text("Challenge: ", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  child: FutureBuilder(
                                            future: DBManagerGuide1.getLists("one", widget.modelID),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                final notes = snapshot.data;
                                                return CanvasTitle(notes[0]['answer']);
                                              }
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            },
                                          ),
                                ),
                              ],
                            ),
                          )
                        )
                      ]
                    )],
                  ),
                )
              ],),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              Text("  Challenge Mapping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, )),
                              Text("  Impact Gap", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, )),
                              Text("  Solutions Mapping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, )),
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 125.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("  Affectted Parties: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,) ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("two", widget.modelID),
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
                                                color: Colors.orange,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 125.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Gaps between solutions/challenges: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 1.0,
                                    ),
                                    Container(
                                  height: 65,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists( "ten", widget.modelID),
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 125.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Local: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                   future: DBManagerGuide1.getLists("six", widget.modelID),
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
                                                color: Colors.green,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 125.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Impact: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("three", widget.modelID),
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
                                                color: Colors.orange,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Gaps within the solution: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                  height: 60.0,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                  future: DBManagerGuide1.getLists("eleven", widget.modelID),
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Global: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("seven", widget.modelID),
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
                                                color: Colors.green,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),  
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Causes: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                   future: DBManagerGuide1.getLists("four", widget.modelID),
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
                                                color: Colors.orange,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Unaddressed Obstacles: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("twelve", widget.modelID),
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("What works and what doesn't: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height:10.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                   future: DBManagerGuide1.getLists("eight", widget.modelID),
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
                                                color: Colors.green,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                // color: Colors.red,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Trends: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                   future: DBManagerGuide1.getLists("five", widget.modelID),
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
                                                color: Colors.orange,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 125.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Key Lessons: ", style: TextStyle(
                                      fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("thirteen", widget.modelID),
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 125.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Future focus: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Container(
                                  height: 75,
                                  color: Colors.white,
                                  child: FutureBuilder(
                                    future: DBManagerGuide1.getLists("nine", widget.modelID),
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
                                                color: Colors.green,
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
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )
                                  ),
                                  ],
                                ),
                              ),
                              
                            ]
                          ),
                        ],
                      )
                    )
                  ],
                )
              )
            ],
          )
        ),
            ]),
        ),
        ),
    ),
  );
  }
  Future<void> _takeScreenShot() async{
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    await file.writeAsBytes(pngBytes);
    print(file.path);
    return pngBytes; 
   } catch (e) {
      print(e);
    }
  }


  Future<Uint8List> TakeScreenShot2() async{
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
      Toast.show("file saved in : $filePath", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      // print(pngBytes);
      // print(bs64);
      // setState(() {});
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
    //  style: TextStyle(
       // fontWeight: FontWeight.bold
     // ),
    );
  }
}

