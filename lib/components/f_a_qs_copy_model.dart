import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_qs_copy_widget.dart' show FAQsCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FAQsCopyModel extends FlutterFlowModel<FAQsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableController.dispose();
  }
}
