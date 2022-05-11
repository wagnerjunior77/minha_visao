import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'dart:io';

class Pick_image extends StatefulWidget {
  const Pick_image({Key? key}) : super(key: key);

  @override
  _PickimageState createState() => _PickimageState();
}

class _PickimageState extends State<Pick_image> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  final ImageLabeler imageLabeler = GoogleVision.instance.imageLabeler(
    ImageLabelerOptions(confidenceThreshold: 0.9),
  );

  static var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selecionar Imagem'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imagemSelecionada == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(100),
                    child: Image.file(imagemSelecionada!)),
            Container(
                child: Center(
              child: result == null
                  ? Text("Nenhum Resultado")
                  : Text(result, style: TextStyle(fontWeight: FontWeight.bold)),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        pegarImagemGaleria();
                      },
                      icon: Icon(Icons.add_photo_alternate_outlined),
                    )),
                CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        pegarImagemCamera();
                      },
                      icon: Icon(Icons.photo_camera_outlined),
                    )),
              ],
            )
          ],
        ));
  }

  pegarImagemGaleria() async {
    final PickedFile? imagemTemporaria =
        await imagePicker.getImage(source: ImageSource.gallery);

    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
        processImageLabels();
      });
    }
  }

  pegarImagemCamera() async {
    final PickedFile? imagemTemporaria =
        await imagePicker.getImage(source: ImageSource.camera);

    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
      });
    }
  }

  processImageLabels() async {
    GoogleVisionImage myImage = GoogleVisionImage.fromFile(imagemSelecionada!);
    ImageLabeler labeler = GoogleVision.instance
        .imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.9));
    var _imageLabels = await labeler.processImage(myImage);
    result = "";
    for (ImageLabel imageLabel in _imageLabels) {
      setState(() {
        result = result +
            imageLabel.text +
            ":" +
            imageLabel.confidence.toString() +
            "\n";
      });
      break;
    }
  }
}
