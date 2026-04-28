import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkingManager {
  final catNotifier = ValueNotifier('');

  Future<void> getRequest() async {
    final uri = Uri.parse('https://catfact.ninja/fact');
    final response = await get(uri);
    print(response.statusCode);

    final jsonString = response.body;
    final map = jsonDecode(jsonString);

    catNotifier.value = map['fact'];
  }

  Future<void> postRequest() async {}
}
