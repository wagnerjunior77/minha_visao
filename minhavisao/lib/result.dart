import 'package:flutter/material.dart';
import 'dart:io';
import 'pick_image.dart' as pickImage;

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  ResultState createState() => ResultState();
}

class ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resultado da Audiovisualização'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
