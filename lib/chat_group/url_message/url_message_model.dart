import '/flutter_flow/flutter_flow_util.dart';
import 'url_message_widget.dart' show UrlMessageWidget;
import 'package:flutter/material.dart';

class UrlMessageModel extends FlutterFlowModel<UrlMessageWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for url_field widget.
  FocusNode? urlFieldFocusNode;
  TextEditingController? urlFieldTextController;
  String? Function(BuildContext, String?)? urlFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    urlFieldFocusNode?.dispose();
    urlFieldTextController?.dispose();
  }
}
