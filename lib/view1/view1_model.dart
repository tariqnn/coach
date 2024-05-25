import '/flutter_flow/flutter_flow_util.dart';
import 'view1_widget.dart' show View1Widget;
import 'package:flutter/material.dart';

class View1Model extends FlutterFlowModel<View1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
