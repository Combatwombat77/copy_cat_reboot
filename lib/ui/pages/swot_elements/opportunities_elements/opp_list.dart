import 'package:copy_cat/providers/opps_providers.dart';
import 'package:copy_cat/providers/threats_providers.dart';
import 'package:copy_cat/ui/pages/swot_elements/opportunities_elements/opp_inputs.dart';
import 'package:flutter/material.dart';

class OppsList extends StatefulWidget {

  @override
  OppsListState createState() {
    return new OppsListState();
  }
}

class OppsListState extends State<OppsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunities'),
      ),
      body: FutureBuilder(
        future: OppsProvider.getOppsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   Opps(NoteMode.Editing, notes[index]))
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
                          _NoteText(notes[index]['text'])
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Opps(NoteMode.Adding, null))
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

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
          color: Colors.grey.shade600
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}