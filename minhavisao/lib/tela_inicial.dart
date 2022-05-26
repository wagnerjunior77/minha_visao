import 'package:flutter/material.dart';
import 'package:minhavisao/pick_image.dart';
import 'package:minhavisao/pick_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

    speakText(String text) async {
      await flutterTts.setLanguage("pt-BR");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(181, 0, 0, 0),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.9,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 45, 93, 119),
                    Color(0xFF107C8F),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('images/icone2_app.png'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const Text(
                      "Minha Visão",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  padding: const EdgeInsets.all(2.0),
                  icon: const Icon(
                    Icons.volume_up,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  iconSize: 40,
                  onPressed: () {
                    speakText("Reconhecer Imagem");
                  }),
              SingleChildScrollView(
                child: InkWell(
                  child: Container(
                    width: 280,
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 45, 93, 119),
                            Color(0xFF107C8F),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 2.0),
                      child: const Text(
                        "Reconhecer Imagem",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Pick_image()));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  padding: const EdgeInsets.all(2.0),
                  icon: const Icon(
                    Icons.volume_up,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  iconSize: 40,
                  onPressed: () {
                    speakText("Reconhecer Texto");
                  }),
              SingleChildScrollView(
                child: InkWell(
                  child: Container(
                    width: 280,
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 45, 93, 119),
                            Color(0xFF107C8F),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 2.0),
                      child: const Text(
                        "Reconhecer Texto    ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Pick_text()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
