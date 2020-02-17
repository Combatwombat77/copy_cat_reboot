import 'package:copy_cat/providers/pain_relievers_provider.dart';
import 'package:flutter/material.dart';

enum NoteMode {
  Editing,
  Adding
}

class Note extends StatefulWidget {

  final NoteMode noteMode;
  final Map<String, dynamic> note;

  Note(this.noteMode, this.note);

  @override
  NoteState createState() {
    return new NoteState();
  }
}

class NoteState extends State<Note> {

  final TextEditingController _titleController = TextEditingController();

  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];

    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Pain Reliever' : 'Edit Pain Reliever'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Pain Reliever'
              ),
            ),
            Container(height: 8,),
            
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleController.text;
 

                  if (widget?.noteMode == NoteMode.Adding) {
                    PainsProvider.insertPains({
                      'title': title,

                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    PainsProvider.updatePains({
                      'id': widget.note['id'],
                      'title': _titleController.text,
                    });
                  }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await PainsProvider.deletePains(widget.note['id']);
                      Navigator.pop(context);
                    }),
                  )
                 : Container()
              ],
            )
          ],
        ),
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

