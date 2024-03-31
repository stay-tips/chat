import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chatServerUri = prefs.getString('ff_chatServerUri') ?? _chatServerUri;
    });
    _safeInit(() {
      _messagesOnDb = prefs.getBool('ff_messagesOnDb') ?? _messagesOnDb;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _chatServerUri = 'http://ha.local';
  String get chatServerUri => _chatServerUri;
  set chatServerUri(String value) {
    _chatServerUri = value;
    prefs.setString('ff_chatServerUri', value);
  }

  bool _messagesOnDb = false;
  bool get messagesOnDb => _messagesOnDb;
  set messagesOnDb(bool value) {
    _messagesOnDb = value;
    prefs.setBool('ff_messagesOnDb', value);
  }

  dynamic _socket;
  dynamic get socket => _socket;
  set socket(dynamic value) {
    _socket = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
