
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:openai/gpt_3.dart';
import 'package:openai/home.dart';

void main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  OpenAI openAI = new OpenAI(apiKey: "YOUR_KEY_HERE");
  runApp(MyApp(openAI));
}

class MyApp extends StatelessWidget {
  final OpenAI openAI;
  MyApp(this.openAI);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(openAI),
    );
  }
}
