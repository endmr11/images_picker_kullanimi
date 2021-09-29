import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

class ResimCekmeEkrani extends StatefulWidget {
  const ResimCekmeEkrani({Key? key}) : super(key: key);

  @override
  _ResimCekmeEkraniState createState() => _ResimCekmeEkraniState();
}

class _ResimCekmeEkraniState extends State<ResimCekmeEkrani> {
  String? path;

  Future resimCek() async {
    List<Media>? res = await ImagesPicker.openCamera(
      pickType: PickType.image,
      quality: 0.5,
    );
    if (res != null) {
      print(res[0].path);
      setState(() {
        path = res[0].path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resim Çekme",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: (path != null) ? Image.file(File(path!)) : Placeholder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  resimCek();
                },
                child: Text(
                  "Resim Çek",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
