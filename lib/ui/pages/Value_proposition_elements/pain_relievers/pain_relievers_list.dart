import 'package:copy_cat/providers/pain_relievers_provider.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/pain_relievers/pain_relievers_input.dart';
import 'package:flutter/material.dart';


class PainsList extends StatefulWidget {

  @override
  NotesListState  createState() => NotesListState();
    
  }


class NotesListState extends State<PainsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pain Relievers'),
      ),
      body: FutureBuilder(
        future: PainsProvider.getPainsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Note(NoteMode.Editing, notes[index]))
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            itemCount: notes == null? 0 : notes.length,            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Note(NoteMode.Adding, null))
          );
        },
        child: Icon(Icons.add),
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
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
