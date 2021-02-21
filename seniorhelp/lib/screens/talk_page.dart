import 'package:avatar_glow/avatar_glow.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TalkPage extends StatefulWidget {
  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  stt.SpeechToText _speech;
  bool voiceListen = false;
  String voiceText = 'Press the button and start speaking';

  List<Map> messageList = List();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void getDialogFlowAnswer(question) async {
    AuthGoogle dialogjsonfile =
        await AuthGoogle(fileJson: "assets/bchacks2021-ljdx-83dea38b2911.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: dialogjsonfile, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(question);
    setState(() {
      messageList.insert(0, {
        "data": 0,
        "message": response.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Talk to Sarah",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomSheet: Padding(padding: EdgeInsets.only(bottom: 30.0)),
      floatingActionButton: AvatarGlow(
<<<<<<< HEAD
          animate: voiceListen,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 35.0,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          child: Material(
            elevation: 10.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              child: Icon(
                voiceListen ? Icons.mic : Icons.mic_none,
                size: 50,
              ),
              radius: 110.0,
            ),
=======
        animate: voiceListen,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 45.0,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(
            voiceListen ? Icons.mic : Icons.mic_none,
            size: 40,
>>>>>>> 684359d92f1b229ef04a0f0b0388c8bbceecdcf4
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) => chat(
                        messageList[index]["message"].toString(),
                        messageList[index]["data"]))),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0
                    ? Color.fromRGBO(23, 157, 139, 1)
                    : Colors.orangeAccent,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void _listen() async {
    if (!voiceListen) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => voiceListen = true);
        _speech.listen(
          onResult: (val) => setState(() {
            voiceText = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => voiceListen = false);
      _speech.stop();

      setState(() {
        messageList.insert(0, {"data": 1, "message": voiceText});
      });

      getDialogFlowAnswer(voiceText);
    }
  }
}
