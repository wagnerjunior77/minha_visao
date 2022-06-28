import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:meta/meta.dart';

class SettingsPage extends StatefulWidget {
  static const String id = 'sample1';
  static const String title = 'configuracoes';

  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool _toggled1 = true;
  bool _toggled2 = false;
  bool _toggled3 = false;
  bool _toggledAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(181, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
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
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 15.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(top: 70, left: 46, right: 26),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blueGrey,
            title: const Text(
              'Assistente do aplicativo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            secondary: const Icon(
              Icons.campaign_sharp,
              color: Color(0xFFFFFFFF),
              size: 30,
            ),
            value: _toggled1,
            onChanged: (value) {
              setState(() => _toggled1 = value);
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 46, right: 26),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blueGrey,
            title: const Text(
              'Navegar com botões +/-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            secondary: const Icon(
              Icons.app_shortcut_outlined,
              color: Color(0xFFFFFFFF),
              size: 30,
            ),
            value: _toggled2,
            onChanged: (value) {
              setState(() => _toggled2 = value);
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 46, right: 26),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blueGrey,
            title: const Text(
              'Desativar tradução',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            secondary: const Icon(
              Icons.translate_outlined,
              color: Color(0xFFFFFFFF),
              size: 30,
            ), // Point to Check
            value: _toggled3,
            onChanged: (value) {
              setState(() => _toggled3 = value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(top: 20, left: 46, right: 26),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blueGrey,
            title: const Text(
              'Selecionar todos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (bool value) => setState(() {
              _toggledAll = value;
              _toggled1 = value;
              _toggled2 = value;
              _toggled3 = value;
            }),
            value: _toggledAll,
          ),
        ],
      ),
    );
  }
}
