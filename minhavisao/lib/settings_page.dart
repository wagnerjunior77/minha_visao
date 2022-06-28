import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title:
            const Text('Configurações', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF107C8F),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
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
            ),
            value: _toggled1,
            onChanged: (value) {
              setState(() => _toggled1 = value);
            },
          ),
          SwitchListTile(
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
            ),
            value: _toggled2,
            onChanged: (value) {
              setState(() => _toggled2 = value);
            },
          ),
          SwitchListTile(
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
            ), // Point to Check
            value: _toggled3,
            onChanged: (value) {
              setState(() => _toggled3 = value);
            },
          ),
          SizedBox(
            height: 50,
          ),
          SwitchListTile(
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
