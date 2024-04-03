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

import 'package:web_socket_client/web_socket_client.dart';

Future sendMessage(String text, Future Function() uriAction) async {
  String? uri = FFAppState().chatServerUri;
  if (uri == null) {
    debugPrint("uri is null");
    await uriAction.call();
    uri = FFAppState().chatServerUri;
    debugPrint("uri is $uri");
  }

  WebSocket? socket = FFAppState().socket;
  if (socket == null) {
    debugPrint("initing socket on uri $uri");
    //init socket
    socket = WebSocket(Uri.parse(uri));
    FFAppState().socket = socket;
    debugPrint("socket initialized");

    // Listen to changes in the connection state.
    socket.connection.listen((state) {
      // Handle changes in the connection state.
      debugPrint("state: $state");
    });

    socket.messages.listen((message) {
      // Handle incoming messages.
      debugPrint("message: $message");
    });
  }
  await socket.connection.firstWhere((state) => state is Connected);
  socket.send('{"text": "$text"}');
}
