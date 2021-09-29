import 'dart:io';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

class CokluResimSecmeEkrani extends StatefulWidget {
  const CokluResimSecmeEkrani({Key? key}) : super(key: key);

  @override
  _CokluResimSecmeEkraniState createState() => _CokluResimSecmeEkraniState();
}

class _CokluResimSecmeEkraniState extends State<CokluResimSecmeEkrani> {
  String? path;
  late List<File> images = [];

  Future cokluResimSec() async {
    List<Media>? res = await ImagesPicker.pick(
      count: 3,
      pickType: PickType.all,
    );
    if (res != null) {
      print(res.map((e) => e.path).toList());
      setState(() {
        for (var i = 0; i < res.length; i++) {
          path = res[i].path;
          images.add(File(path!));
          //print("Resim: $images");
        }
      });
    }
    //print("Dosya Yolu: ${res![0].path}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Çoklu Resim Seçme",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  cokluResimSec();
                },
                child: Text(
                  "Çoklu Resim Seç",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.file(
                          images[index],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
