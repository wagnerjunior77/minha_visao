import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';

class Pick_text extends StatefulWidget {
  const Pick_text({Key? key}) : super(key: key);

  @override
  _PicktextState createState() => _PicktextState();
}

class _PicktextState extends State<Pick_text> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";

  speakText() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1.0);
    var translation = await translator.translate(scannedText, to: 'pt');
    await flutterTts.speak(translation.toString());
  }

  speakText2(text) async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  translateScannedText() async {
    var translation = await translator.translate(scannedText, to: 'pt');

    return translation.toString();
  }

  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(181, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF107C8F),
        title: const Text("Reconhecimento de Texto",
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (textScanning) const CircularProgressIndicator(),
                if (!textScanning && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[600]!,
                  ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                Container(
                  child: Text(
                    scannedText,
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 248, 248, 248)),
                  ),
                ),
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
                            getImage(ImageSource.gallery);
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
                            getImage(ImageSource.camera);
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
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
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
            )),
      )),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;

        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Um erro ocorreu durante o escaneamento";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }

    speakText();
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}
