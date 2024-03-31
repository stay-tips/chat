import '/account_creation/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/brand/brand_widget.dart';
import 'auth2_create_profile_widget.dart' show Auth2CreateProfileWidget;
import 'package:flutter/material.dart';

class Auth2CreateProfileModel
    extends FlutterFlowModel<Auth2CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for brand component.
  late BrandModel brandModel;
  // Model for edit_profile_auth_2 component.
  late EditProfileAuth2Model editProfileAuth2Model;

  @override
  void initState(BuildContext context) {
    brandModel = createModel(context, () => BrandModel());
    editProfileAuth2Model = createModel(context, () => EditProfileAuth2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    brandModel.dispose();
    editProfileAuth2Model.dispose();
  }
}
