import 'package:flutter/material.dart';
import 'package:minhavisao/pick_image.dart';
import 'package:minhavisao/pick_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 40, 131, 122),
                  Color.fromARGB(255, 71, 109, 88),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 128,
                  height: 128,
                  child: Image.asset('images/icone2_app.png'),
                ),
                const Text(
                  "Minha Visão",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 50.0, right: 50.0),
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 40, 131, 122),
                    Color.fromARGB(255, 71, 109, 88),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: SizedBox.expand(
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        padding: const EdgeInsets.all(2.0),
                        icon: const Icon(
                          Icons.volume_up,
                          color: Colors.white,
                        ),
                        iconSize: 37,
                        onPressed: () {}),
                    const Text(
                      "Identificar Objeto",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Pick_image()));
                },
              ),
            ),
          ),
          const SizedBox(height: 38),
          Container(
            margin: const EdgeInsets.only(left: 50.0, right: 50.0),
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 30, 100, 93),
                    Color.fromARGB(255, 59, 92, 74),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: SizedBox.expand(
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        padding: const EdgeInsets.all(2.0),
                        icon: const Icon(
                          Icons.volume_up,
                          color: Colors.white,
                        ),
                        iconSize: 37,
                        onPressed: () {}),
                    const Text(
                      "Identificar Texto",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Pick_text()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
