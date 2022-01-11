import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech6/Api/speech_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isListening = false;
  String text = "Press the button and start speech";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech Screen"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 80,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () {
            print("Bismillah1");
            onListening();
            print("Bismillah2");
            if (_isListening == true) {
              print("Bismillah3");
              _isListening = false;
            } else {
              _isListening = true;
            }
          },
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 150),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Future onListening() => SpeechApi.togglerecording(
      onResult: (text) => setState(() {
            this.text = text;
          }));
}
