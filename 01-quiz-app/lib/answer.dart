import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;
  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // ignore: deprecated_member_use
      child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(answerText, style: TextStyle(fontSize: 25)),
          onPressed: x),
    );
  }
}
