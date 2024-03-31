import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'brand_model.dart';
export 'brand_model.dart';

class BrandWidget extends StatefulWidget {
  const BrandWidget({super.key});

  @override
  State<BrandWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  late BrandModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Opacity(
          opacity: 0.7,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/solo-logo-circle.png',
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Green Property',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Whisper',
                fontSize: 20.0,
                letterSpacing: 0.0,
              ),
        ),
      ].divide(const SizedBox(width: 14.0)),
    );
  }
}
