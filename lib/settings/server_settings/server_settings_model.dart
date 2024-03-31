import '/flutter_flow/flutter_flow_util.dart';
import 'server_settings_widget.dart' show ServerSettingsWidget;
import 'package:flutter/material.dart';

class ServerSettingsModel extends FlutterFlowModel<ServerSettingsWidget> {
  ///  Local state fields for this page.

  bool isVerified = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for url widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlController;
  String? Function(BuildContext, String?)? urlControllerValidator;
  String? _urlControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter full server url .';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'not a valid url';
    }
    return null;
  }

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;

  @override
  void initState(BuildContext context) {
    urlControllerValidator = _urlControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    urlFocusNode?.dispose();
    urlController?.dispose();
  }
}
