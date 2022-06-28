import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tflite/tflite.dart';

import 'dart:io';

class Pick_imageTFLITE extends StatefulWidget {
  const Pick_imageTFLITE({Key? key}) : super(key: key);

  @override
  _PickimageState createState() => _PickimageState();
}

class _PickimageState extends State<Pick_imageTFLITE> {
  late final File pickedImage;
  bool isImageLoaded = false;
  late final List result;

  String _name = "";
  String _confidence = "";

  getImageFromGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModelOnImage(pickedImage);
    });
  }

  loadModel() async {
    var resultant = await Tflite.loadModel(
        labels: "assets/labels_mobilenet_quant_v1_224.txt",
        model: "assets/mobilenet_v1_1.0_224_quant.tflite");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      result = res!;

      String str = result[0]['label'];

      _name = str.substring(0);
      _confidence = result != null
          ? (result[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(181, 240, 0, 0),
      appBar: AppBar(
        title: const Text('Reconhecimento de Imagem',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF107C8F),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            isImageLoaded
                ? Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(pickedImage.path)),
                              fit: BoxFit.contain)),
                    ),
                  )
                : Container(),
            SizedBox(height: 30),
            Text('Nome: $_name\nConfidence: $_confidence')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromGallery();
        },
        child: Icon(Icons.photo_album),
      ),
    );
  }
}
