
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class OpenAI {
  String apiKey;
  OpenAI({required this.apiKey});

  Future<String> answer(
      String question,
      int maxTokens,
      List examples,
      List documents,
      {
        String examplesContext = "En 1821, fue su independencia.",
        String searchModel = 'ada',
        String model = 'davinci',
      }
    ) async {

    String apiKey = this.apiKey;

    Map reqData = {
      "question": question,
      "max_tokens": maxTokens,
      'examples' : examples,
      'documents' : documents,
      'examples_context' : examplesContext,
      'search_model' : searchModel,
      'model' : model,
    };

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/answers'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $apiKey",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(reqData),
    ).timeout(const Duration(seconds: 120));

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> resp = map["answers"];
    return resp[0];
  }

}