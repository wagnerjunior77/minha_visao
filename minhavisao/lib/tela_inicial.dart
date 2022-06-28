import 'package:flutter/material.dart';
import 'package:minhavisao/pick_image.dart';
import 'package:minhavisao/pick_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:minhavisao/settings_page.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

    speakText(String text) async {
      await flutterTts.setLanguage("pt-BR");
      await flutterTts.setPitch(1.1);
      await flutterTts.speak(text);
    }

    speakText(
        'Bem-Vindo a tela inicial do Minha Visão, temos dois botões nessa tela, o primeiro levará para a tela de Identificação de Imagem e o segundo para a de Identificar Texto.');

    /*double currentvol = 0.5;
    PerfectVolumeControl.stream.listen((volume) {
      if (volume != currentvol) {
        //only execute button type check once time

        if (volume > currentvol) {
          //if new volume is greater, then it up button
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Pick_image()));
        } else {
          //else it is down button
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Pick_text()));
        }
      }
      currentvol = volume;
    });*/
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: const EdgeInsets.only(top: 30),
                      icon: const Icon(
                        Icons.settings,
                        color: Color(0xFFFFFFFF),
                      ),
                      iconSize: 45,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 50, left: 15.0),
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('images/icone2_app.png'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, left: 15.0),
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
                    speakText(
                        'identificar imagem: na parte inferior, temos dois botões, no botão esquerdo é possível acessar a galeria do dispositivo, e no botão direito a câmera');
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
                    speakText(
                        'identificar texto: na parte inferior, temos dois botões, no botão esquerdo é possível acessar a galeria do dispositivo, e no botão direito a câmera');
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
