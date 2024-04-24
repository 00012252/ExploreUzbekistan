import '/flutter_flow/flutter_flow_util.dart';
import 'city_page_widget.dart' show CityPageWidget;
import 'package:flutter/material.dart';

class CityPageModel extends FlutterFlowModel<CityPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
