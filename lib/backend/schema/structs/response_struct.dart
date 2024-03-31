// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ResponseStruct extends FFFirebaseStruct {
  ResponseStruct({
    String? type,
    String? userId,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _userId = userId,
        _content = content,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? 'chat';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  static ResponseStruct fromMap(Map<String, dynamic> data) => ResponseStruct(
        type: data['type'] as String?,
        userId: data['user_id'] as String?,
        content: data['content'] as String?,
      );

  static ResponseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResponseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'user_id': _userId,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponseStruct &&
        type == other.type &&
        userId == other.userId &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([type, userId, content]);
}

ResponseStruct createResponseStruct({
  String? type,
  String? userId,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseStruct(
      type: type,
      userId: userId,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseStruct? updateResponseStruct(
  ResponseStruct? response, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    response
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseStructData(
  Map<String, dynamic> firestoreData,
  ResponseStruct? response,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (response == null) {
    return;
  }
  if (response.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && response.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseData = getResponseFirestoreData(response, forFieldValue);
  final nestedData = responseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = response.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseFirestoreData(
  ResponseStruct? response, [
  bool forFieldValue = false,
]) {
  if (response == null) {
    return {};
  }
  final firestoreData = mapToFirestore(response.toMap());

  // Add any Firestore field values
  response.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseListFirestoreData(
  List<ResponseStruct>? responses,
) =>
    responses?.map((e) => getResponseFirestoreData(e, true)).toList() ?? [];
