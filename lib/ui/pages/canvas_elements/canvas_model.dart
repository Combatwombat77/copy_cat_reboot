import 'package:copy_cat/models/db_manager.dart';
import 'package:flutter/material.dart';


class CanvasModelR extends StatefulWidget {
  final int modelID;

  CanvasModelR(this.modelID);
  @override
  _CanvasModelRState createState() => _CanvasModelRState();
}

class _CanvasModelRState extends State<CanvasModelR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: Container(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text("The Business Model Canvas",  style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                  ],), 
                  Card(
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          Text("Customer Segments", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          Text("Value Propositions", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          Text("Channels", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                        ]),
                        TableRow(
                          children: [
                            Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Customer Segments", widget.modelID),
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
                                                color: Colors.lightBlueAccent,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),
                             Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Value Propositions", widget.modelID),
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
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),
                            
                      
                             Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Channels", widget.modelID),
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
                                                color: Colors.red,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),
                          ]
                        ),
                        TableRow(
                          children: [
                            
                            Text("Customer Relationships", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    
                            Text("Revenue Streams", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                        
                            Text("Key Resources", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          

                          ]
                        ),
                        TableRow(children: [
                          Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Customer Relationships", widget.modelID),
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
                                                color: Colors.pink,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),

                            Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Revenue Streams", widget.modelID),
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
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),

                            Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Key Resources", widget.modelID),
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
                                                color: Colors.grey,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),
                        ]), 
                        TableRow(
                          children: [
                        
                            Text("Key Activities", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),

                            Text("Key Partners", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                      
                            Text("Cost Structure", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          

                          ]
                        ),

                        TableRow(children: [
                          Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Key Activities", widget.modelID),
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
                                                color: Colors.tealAccent,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),

                            Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Key Partners", widget.modelID),
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
                                                color: Colors.amber,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),

                            Container(
                              
                              height: 150,
                              // width: ,
                              child: FutureBuilder(
                                  future: DBManagerViews.getLists("Cost Structure", widget.modelID),
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
                                                color: Colors.blueGrey,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]['title']),
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
      ),
                                
                            ),
                        ])

                      ],
                    ),
                  )
                ],
              ),
            )
      ],)
      )
    
    );
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


class CanvasModelP extends StatefulWidget {
  final int modelID;

  CanvasModelP(this.modelID);
  @override
  _CanvasModelPState createState() => _CanvasModelPState();
}

class _CanvasModelPState extends State<CanvasModelP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview"),),
      body:  FutureBuilder(
       future: DBManagerViews.getLists("Customer Segments", widget.modelID),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CanvasTitle(notes[index]['title']),
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
      ),
    );
  }
}