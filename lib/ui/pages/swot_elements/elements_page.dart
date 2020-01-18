
import 'package:copy_cat/inherited_widgets/strength_inherited_widget.dart';
import 'package:flutter/material.dart';


enum AddMode{
  Editing,
  Adding
}

class Items extends StatefulWidget{
  

  final AddMode _addMode;

  Items(this._addMode);

  @override 
  ItemsState createState(){
    return new ItemsState();
  }
  }
class ItemsState extends State<Items>{

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _textController = TextEditingController();

    List<Map<String,String>>get _strengths => StrengthInheritedWidget.of(context).strengths;

 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._addMode == AddMode.Adding ? 'Add Strength': 'Edit Strength'
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
                hintText: 'Add your  Strength'
              ),
            ),
            Container(height:8,),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Add a description'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _SwotButtons('Save', Colors.blue, (){                 
                    final title =_titleController.text;
                    final text = _textController.text;

                    if (widget?._addMode==AddMode.Adding){
                   _strengths.add({
                      'title': title,
                      'text': text
                    });
                 }//else if (widget?._addMode == AddMode.Editing) {
                   // _strengths[widget.index] = {
                    //  'title': title,
                     // 'text': text
                   // };
                 // }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                 _SwotButtons('Discard', Colors.grey, (){
                    Navigator.pop(context);
                  }),
                  widget._addMode == AddMode.Editing?
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                  child:_SwotButtons('Delete', Colors.red, (){
                    Navigator.pop(context);
                  })
                )
                : Container( )  
            ],)
          ],
        )
      ),
    );
  }
}


class _SwotButtons extends StatelessWidget{

  final String _text;
  final Color _color;
  final Function _onPressed;

  _SwotButtons(this._text,this._color, this._onPressed);
 
  @override 
  Widget build(BuildContext context){
    return MaterialButton(
                  onPressed: _onPressed,
                  child: Text( _text,
                  style: TextStyle(color: Colors.white),
                  ),
                  height: 50,
                  minWidth:100,
                  color: _color,
                );
  }
}