import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 10,bottom: 70),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            'ROPA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 80,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
