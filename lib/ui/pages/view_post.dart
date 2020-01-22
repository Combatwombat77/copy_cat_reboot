import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:copy_cat/models/db_manager.dart';

final formkey = new GlobalKey<FormState> ();

enum viewMode {
  customerSegments,
  value_propositions,
  Channels,
  customer_relationships,
  revenue_stream,
  key_resources,
  key_activities,
  key_partners,
  cost_structure
}


class ViewPost extends StatefulWidget {
  final String postName;
  ViewPost(this.postName);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {


  TextEditingController controller;
  TextEditingController _editController = new TextEditingController();

  String edit;
  List items = [
    "Hello",
    "World"
  ];


  
  @override
  void initState(){
    super.initState();
    _editController.addListener((){
      setState(() {
        edit = _editController.text;
      });
    });
  }

  void upDateList(int index, String editedPost){
    setState(() {
      items.removeAt(index);
      items.replaceRange(index, index, ["$editedPost, $index"]);
      print(items);
    });
  }

  void newPost(String post){

    setState(() {
      items.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Adding, null, widget.postName)));
        },
        backgroundColor: Uidata.btnColor,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
//        future: getAccList(widget.postName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName))
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _NoteTitle(notes[index]['title']),
                          Container(height: 4,),
                          _NoteDescription(notes[index]['description'])
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget viewCard(String post, int index){

    FocusNode _focusNode = new FocusNode();
    return Padding(
        padding: const EdgeInsets.all(10),
        child:Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[


                    Row(
                      children: <Widget>[
                        Text(post, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 240,
                          child: EditableText(
                            controller: _editController,
                            focusNode: _focusNode,
                            style: TextStyle(color:  Colors.black),
                            cursorColor: Colors.black,
                            backgroundCursorColor: Colors.white,
                            forceLine: true,
//                            onSubmitted: ,

                          )
                        )
                      ],

                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          //                splashColor: Colors.grey,
                          color: Colors.white,
                          child: Text("EDIT POST", style: TextStyle(color: Uidata.primaryColor),),
                          onPressed: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPost()));
                          upDateList(index, edit);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }

  getAccList(String categoryName) {
    var items = [
      "Customer Segments",
      "Value Propositions",
      "Channels",
      "Customer Relationships",
      "Revenue Stream",
      "Key Resources",
      "Key Activities",
      "Key Partners",
      "Cost Structure"
    ];
    if(categoryName == items[0]){
      DBManager.getCustSegList();
    }else if(categoryName == items[1]){
      DBManager.getValPropsList();
    }else if(categoryName == items[2]){
      DBManager.getChannelList();
    }else if(categoryName == items[3]){
      DBManager.getCustRelList();
    }else if(categoryName == items[4]){
      DBManager.getRevStreamList();
    }else if(categoryName == items[5]){
      DBManager.getKeyResList();
    }else if(categoryName == items[6]){
      DBManager.getKeyActList();
    }else if(categoryName == items[7]){
      DBManager.getKeyPartList();
    }else if(categoryName == items[8]){
      DBManager.getCostStructList();
    }
  }




}

class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class _NoteDescription extends StatelessWidget {
  String description;

  _NoteDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}




enum NoteMode {
  Editing,
  Adding
}

class CanvasNote extends StatefulWidget {

  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String parentPageName;

  CanvasNote(this.noteMode, this.note, this.parentPageName);

  @override
  CanvasNoteState createState() {
    return new CanvasNoteState();
  }
}

class CanvasNoteState extends State<CanvasNote> {

  String title;
  String noteDescription;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final form = formkey.currentState;

  var items = [
    "Customer Segments",
    "Value Propositions",
    "Channels",
    "Customer Relationships",
    "Revenue Stream",
    "Key Resources",
    "Key Activities",
    "Key Partners",
    "Cost Structure"
  ];

  bool validateForm() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      return true;

    }else{
      return false;
    }
  }
  

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      setState(() {
        title = _titleController.text;
      });
    });

    _descriptionController.addListener(() {
      setState(() {
        noteDescription = _descriptionController.text;
      });
    });

  }
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _descriptionController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              onSaved: (value) => title = value,
              validator: (val) =>  val.length == 0? "Please enter title" : null,
              decoration: InputDecoration(
                hintText: 'Note title'
              ),
            ),
            Container(height: 8,),
            TextFormField(
              validator: (val) =>  val.length == 0? "Please enter description" : null,
              onSaved: (value) => noteDescription = value,
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Note description'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  if(validateForm()) {
                    if(widget.parentPageName == items[0]) {
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertCustSegNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateCustSegNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[1]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertValPropsNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateValPropNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[2]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertChannelsNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateChannelNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[3]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertCustRelNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateCustRelNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[4]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertRevStreamNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateRevStreamNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[5]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertKeyResNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateKeyResNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[6]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertKeyActNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateKeyActNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[7]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertKeyPartNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateKeyPartNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }else if(widget.parentPageName == items[8]){
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManager.insertCostStructNote({
                          'title': title,
                          'description': noteDescription
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManager.updateCostStructNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    }
                  Navigator.pop(context);
                  }
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await DBManager.deleteCustSegNote(widget.note['id']);
                      Navigator.pop(context);
                    }),
                  )
                 : Container()
              ],
            )
          ],
        ),
        )
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 100,
      color: _color,
    );
  }
}




