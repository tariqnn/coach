import '/flutter_flow/flutter_flow_util.dart';
import 'userview_widget.dart' show UserviewWidget;
import 'package:flutter/material.dart';

class UserviewModel extends FlutterFlowModel<UserviewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
