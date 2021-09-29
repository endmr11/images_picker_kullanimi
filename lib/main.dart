import 'package:flutter/material.dart';
import 'package:sunucuya_coklu_resim_yukleme/coklu_resim.dart';
import 'package:sunucuya_coklu_resim_yukleme/resim_cekme.dart';
import 'package:sunucuya_coklu_resim_yukleme/video_cekme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResimCekmeEkrani(),
                    ),
                  );
                },
                child: Text(
                  "Resim Çekme Ekranı",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CokluResimSecmeEkrani(),
                    ),
                  );
                },
                child: Text(
                  "Çoklu Resim Seç Ekranı",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoCekmeSayfasi(),
                    ),
                  );
                },
                child: Text(
                  "Video Çekme Ekranı",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
