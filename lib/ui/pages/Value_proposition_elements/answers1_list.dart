import 'package:copy_cat/ui/pages/Value_proposition_elements/value_proposition.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:flutter/material.dart';

class Answer1List extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  Answer1List(this.question, this.modelId, this.title);
  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<Answer1List> {
  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),
          FutureBuilder(
            future: DBManagerAnswers.getLists(widget.question, widget.modelId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                print(notes);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Answers1(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                        },
                        child: Card(
                          child: new Container(
                              child: new Center(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _NoteTitle(
                                              notes[index]['answer'],
                                            ),

                                            // set some style to text

                                            // set some style to text
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: const Color(0xFF167F67),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Answers1(
                                                              NoteMode.Editing,
                                                              notes[index],
                                                              widget
                                                                  .question)));
                                            }),
                                        new IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever,
                                                color: const Color(0xFF167F67)),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0)),
                        ));
                  },
                  itemCount: notes == null ? 0 : notes.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class QueAnswer1List extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  QueAnswer1List(this.question, this.modelId, this.title);
  @override
  QueNoteListState createState() {
    return new QueNoteListState();
  }
}

class QueNoteListState extends State<QueAnswer1List> {
  var list = ["one", "two", "three", "four", "five", "six"];

  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),
          FutureBuilder(
            future:
                DBManagerQueAnswers.getLists(widget.question, widget.modelId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                print(notes);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QueAnswers1(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                        },
                        child: Card(
                          child: new Container(
                              child: new Center(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _NoteTitle(
                                              notes[index]['answer'],
                                            ),

                                            // set some style to text

                                            // set some style to text
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: const Color(0xFF167F67),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QueAnswers1(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                                            }),
                                        new IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever,
                                                color: const Color(0xFF167F67)),
                                            onPressed: () {
                                                DBManagerQueAnswers.deleteNote(
                                            widget.notes['id'], widget.question);
                                                 Navigator.pop(context);
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0)),
                        ));
                  },
                  itemCount: notes == null ? 0 : notes.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
