import '/flutter_flow/flutter_flow_util.dart';
import 'discover_uzbekistan_widget.dart' show DiscoverUzbekistanWidget;
import 'package:flutter/material.dart';

class DiscoverUzbekistanModel
    extends FlutterFlowModel<DiscoverUzbekistanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
