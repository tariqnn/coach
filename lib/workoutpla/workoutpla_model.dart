import '/flutter_flow/flutter_flow_util.dart';
import 'workoutpla_widget.dart' show WorkoutplaWidget;
import 'package:flutter/material.dart';

class WorkoutplaModel extends FlutterFlowModel<WorkoutplaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
