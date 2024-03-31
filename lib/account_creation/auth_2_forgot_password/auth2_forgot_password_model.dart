import '/flutter_flow/flutter_flow_util.dart';
import '/home/brand/brand_widget.dart';
import 'auth2_forgot_password_widget.dart' show Auth2ForgotPasswordWidget;
import 'package:flutter/material.dart';

class Auth2ForgotPasswordModel
    extends FlutterFlowModel<Auth2ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for brand component.
  late BrandModel brandModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  @override
  void initState(BuildContext context) {
    brandModel = createModel(context, () => BrandModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    brandModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }
}
