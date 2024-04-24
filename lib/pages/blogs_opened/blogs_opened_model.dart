import '/flutter_flow/flutter_flow_util.dart';
import 'blogs_opened_widget.dart' show BlogsOpenedWidget;
import 'package:flutter/material.dart';

class BlogsOpenedModel extends FlutterFlowModel<BlogsOpenedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
