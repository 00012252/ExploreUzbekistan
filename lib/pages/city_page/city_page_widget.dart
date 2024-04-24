import '/backend/backend.dart';
import '/components/attractions_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'city_page_model.dart';
export 'city_page_model.dart';

class CityPageWidget extends StatefulWidget {
  const CityPageWidget({
    super.key,
    required this.citiesDoc,
  });

  final CitiesRecord? citiesDoc;

  @override
  State<CityPageWidget> createState() => _CityPageWidgetState();
}

class _CityPageWidgetState extends State<CityPageWidget> {
  late CityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CityPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            valueOrDefault<String>(
              widget.citiesDoc?.cityName,
              'cityName',
            ),
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 28.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Landmarks',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Urbanist',
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: StreamBuilder<List<AttractionsRecord>>(
                      stream: queryAttractionsRecord(
                        queryBuilder: (attractionsRecord) =>
                            attractionsRecord.where(
                          'attractionCityLocation',
                          isEqualTo: valueOrDefault<String>(
                            widget.citiesDoc?.cityName,
                            'cityName',
                          ),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitDoubleBounce(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<AttractionsRecord> listViewAttractionsRecordList =
                            snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewAttractionsRecordList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewAttractionsRecord =
                                listViewAttractionsRecordList[listViewIndex];
                            return AttractionsListWidget(
                              key: Key(
                                  'Keya5v_${listViewIndex}_of_${listViewAttractionsRecordList.length}'),
                              attractionDoc: listViewAttractionsRecord,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
