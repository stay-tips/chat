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

Future sendMessage(String text, dynamic socket) async {
  if (socket == null) {
    print("socket is null");
    return;
  }

  await socket.connection.firstWhere((state) => state is Connected);
  socket.send(jsonEncode({"text": 'ciao come ti chiami?'}));
}
