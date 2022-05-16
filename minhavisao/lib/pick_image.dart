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

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reconhecimento de Imagem',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 40, 131, 122),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Column contents horizontally,
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Column contents vertically,
          children: [
            imagemSelecionada == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(100),
                    child: Image.file(imagemSelecionada!)),
            Center(
              child: result == null
                  ? Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      color: Colors.grey[300]!,
                    )
                  : Text(result,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 40, 131, 122),
                        onPrimary: Colors.grey,
                        shadowColor: Colors.grey[400],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: () {
                        pegarImagemGaleria();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.image,
                              size: 30,
                              color: Colors.white,
                            ),
                            const Text("Galeria",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 40, 131, 122),
                        onPrimary: Colors.grey,
                        shadowColor: Colors.grey[400],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: () {
                        pegarImagemCamera();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30,
                            ),
                            const Text(
                              "Câmera",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ))));
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
        processImageLabels();
      });
    }
  }

  processImageLabels() async {
    GoogleVisionImage myImage = GoogleVisionImage.fromFile(imagemSelecionada!);
    ImageLabeler labeler = GoogleVision.instance
        .imageLabeler(const ImageLabelerOptions(confidenceThreshold: 0.9));
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
