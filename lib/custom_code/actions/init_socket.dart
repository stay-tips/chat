// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:web_socket_client/web_socket_client.dart';

dynamic initSocket(Future Function() errorAction) async {
  // Create a WebSocket client.
  String? uri = FFAppState().chatServerUri;
  if (uri == null) {
    errorAction.call();
    return;
  }

  WebSocket socket = WebSocket(Uri.parse(uri));

  // query connection state
  // final connectionState = socket.connection.state;

  // Listen to messages from the server.
  socket.messages.listen((message) {
    // Handle incoming messages.
    final response = jsonDecode(message);
    debugPrint('response:$response');
  });

  socket.connection.listen((state) {
    // Handle changes in the connection state.
    debugPrint("state is $state");
  });

  await socket.connection.firstWhere((state) => state is Connected);
  FFAppState().socket = socket;
  // socket.send(jsonEncode({"text": 'ciao come ti chiami?'}));

  // Close the connection.
  // socket.close();

  return socket;
}
