import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPrescription extends StatefulWidget {
  @override
  _AddPrescriptionState createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
    final _formkey = GlobalKey<FormState>();
  
  File imageFile;
  File imageFile2;
  File imageFile3;
  
  _openGallery(BuildContext context) async {
   var picture = imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
      print('image path $imageFile');
       FileImage(imageFile);

    });
    Navigator.of(context).pop();
  }
    _openGallery2(BuildContext context) async {
   var picture = imageFile2 = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile2 = picture;
      print('image path $imageFile2');

    });

  }
    _openGallery3(BuildContext context) async {
   var picture = imageFile3 = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile3= picture;
      print('image path $imageFile3');

    });

  }

  _openCamera(BuildContext context) async {
    var picture = imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = picture;
      print('image path $imageFile');
  });
      Navigator.of(context).pop();
  } 

  Future <void> _showImageDialogue(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Choose a source'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),

      );
      
    });
  }

Widget _decideImageView(){
  if (imageFile== null){
    return Text('Please add an image');
  }else{
    return Image.file(imageFile,width:100,height:100);
  }
}

Widget _decideImageView2(){
  if (imageFile2== null){
    return Text('Please add an image');
  }else{
    return Image.file(imageFile2,width:100,height:100);
  }
}

Widget _decideImageView3(){
  if (imageFile3== null){
    return Text('Please add an image');
  }else{
    return Image.file(imageFile3,width:100,height:100);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.bottomLeft,
            end: Alignment.topRight,
            colors:[
              Colors.greenAccent,
              Colors.yellowAccent[200]
            ]
          )
        ),
      ),Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
             Column( children: <Widget>[
                SizedBox(height:30.0),
               RaisedButton(color: Colors.black,
                  child: Text('Add image',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: () => _showImageDialogue( context),
                  ),
                  RaisedButton(color: Colors.black,
                  child: Text('Add image2',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: () => _openGallery2( context),
                  ),
                  RaisedButton(color: Colors.black,
                  child: Text('Add image3',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: () => _openGallery3( context),
                  ),
             ],

             ),               
                 SizedBox(height:10.0),
                 //dropdown
                 //slider
                
                 SizedBox(height:10.0),
                 _decideImageView(),
                 SizedBox(height:10.0),
                 
                 SizedBox(height:10.0),
                 _decideImageView2(),
                 SizedBox(height:20.0),
                 
                 SizedBox(height:10.0),
                 _decideImageView3(),

                

            ],
          ),
      ),
      ),
      ],
      ),
      );
  }
}
