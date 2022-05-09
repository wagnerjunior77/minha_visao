import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Pick_image extends StatefulWidget {
  const Pick_image({Key? key}) : super(key: key);

  @override
  _PickimageState createState() => _PickimageState();
}

class _PickimageState extends State<Pick_image> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;
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
                    padding: const EdgeInsets.all(16),
                    child: Image.file(imagemSelecionada!)),
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
}
