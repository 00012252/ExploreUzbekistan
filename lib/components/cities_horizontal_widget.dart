import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cities_horizontal_model.dart';
export 'cities_horizontal_model.dart';

class CitiesHorizontalWidget extends StatefulWidget {
  const CitiesHorizontalWidget({
    super.key,
    required this.citiesDoc,
  });

  final CitiesRecord? citiesDoc;

  @override
  State<CitiesHorizontalWidget> createState() => _CitiesHorizontalWidgetState();
}

class _CitiesHorizontalWidgetState extends State<CitiesHorizontalWidget> {
  late CitiesHorizontalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CitiesHorizontalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              'CityPage',
              queryParameters: {
                'citiesDoc': serializeParam(
                  widget.citiesDoc,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'citiesDoc': widget.citiesDoc,
              },
            );
          },
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                width: 120.0,
                height: 189.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.citiesDoc?.image,
                      'City Image',
                    ),
                    width: 300.0,
                    height: 175.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.citiesDoc?.cityName,
              'cityName',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
