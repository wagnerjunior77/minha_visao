import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'dart:io';

class Pick_image extends StatefulWidget {
  const Pick_image({Key? key}) : super(key: key);

  @override
  _PickimageState createState() => _PickimageState();
}

class _PickimageState extends State<Pick_image> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;
  final FlutterTts flutterTts = FlutterTts();
  final ImageLabeler imageLabeler = GoogleVision.instance.imageLabeler(
    ImageLabelerOptions(confidenceThreshold: 0.9),
  );

  final translator = GoogleTranslator();

  static var result;
  speakText() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1.0);
    var translation = await translator.translate(result, to: 'pt');
    await flutterTts.speak(translation.toString());
  }

  speakText2(text) async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(181, 0, 0, 0),
        appBar: AppBar(
          title: const Text('Reconhecimento de Imagem',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF107C8F),
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
                    : Text(
                        result,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 50),
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF107C8F),
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                        shadowColor: Color.fromARGB(255, 0, 0, 0),
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
                        primary: Color(0xFF107C8F),
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                        shadowColor: Color.fromARGB(255, 0, 0, 0),
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

  processImageLabels() async {
    GoogleVisionImage myImage = GoogleVisionImage.fromFile(imagemSelecionada!);
    ImageLabeler labeler = GoogleVision.instance
        .imageLabeler(const ImageLabelerOptions(confidenceThreshold: 0.9));
    var _imageLabels = await labeler.processImage(myImage);
    result = "";
    var counter = 0;
    for (ImageLabel imageLabel in _imageLabels) {
      counter += 1;
      setState(() {
        result = result + imageLabel.text + "\n";
      });

      speakText();
      if (counter == 3) {
        counter = 0;

        break;
      }
    }
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
}
