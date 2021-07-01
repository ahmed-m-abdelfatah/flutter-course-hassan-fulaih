import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function q;
  final int resultScore;
  Result(this.q, this.resultScore);

  String get resultPhrase {
    String resultPhrase;
    if (resultScore >= 70) {
      resultPhrase = 'You are awesome !';
    } else if (resultScore >= 40) {
      resultPhrase = 'Pretty likable !';
    } else {
      resultPhrase = 'You are so bad !';
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Done !\nScore is $resultScore\n$resultPhrase',
            style:
                TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              'Restart',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            onPressed: q,
          )
        ],
      ),
    );
  }
}
