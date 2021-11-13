import 'package:flutter/material.dart';
import 'package:meditaion_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';

class MeditationAppScreen extends StatefulWidget {
  MeditationAppScreen({Key? key}) : super(key: key);

  @override
  _MeditationAppScreenState createState() => _MeditationAppScreenState();
}

class _MeditationAppScreenState extends State<MeditationAppScreen> {
  final List<Item> items = [
    Item(
        audioPath: "meditation_audio/forest.mp3",
        imagePath: "images/forest.jpeg",
        name: "Forest"),
    Item(
        audioPath: "meditation_audio/night.mp3",
        imagePath: "images/night.jpeg",
        name: "Night"),
    Item(
        audioPath: "meditation_audio/ocean.mp3",
        imagePath: "images/ocean.jpeg",
        name: "Ocean"),
    Item(
        audioPath: "meditation_audio/waterfall.mp3",
        imagePath: "images/waterfall.jpeg",
        name: "Waterfall"),
    Item(
        audioPath: "meditation_audio/wind.mp3",
        imagePath: "images/wind.jpeg",
        name: "Wind"),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  int? playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(items[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Text(items[index].name),
                  leading: IconButton(
                    onPressed: () {
                      if (playingIndex == index) {
                        audioPlayer.stop();
                        setState(() {
                          playingIndex = null;
                        });
                      } else {
                        audioPlayer.setAsset(items[index].audioPath);
                        audioPlayer.play();

                        setState(
                          () {
                            playingIndex = index;
                          },
                        );
                        try {} catch (e) {
                          print(e);
                        }
                      }
                    },
                    icon: playingIndex == index
                        ? Icon(Icons.stop)
                        : Icon(Icons.play_arrow),
                  ),
                ),

                // padding: EdgeInsets.symmetric(vertical: 5.0),
                // height: 100.0,
                // child: Text(items[index].name),

                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(items[index].imagePath),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
