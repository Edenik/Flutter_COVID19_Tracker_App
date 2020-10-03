import 'package:flutter/foundation.dart';
import 'package:flutter_covid19_app/app/services/api.dart';
import 'package:flutter_covid19_app/app/services/endpoint_data.dart';

class EndpointsData {
  final Map<Endpoint, EndpointData> values;
  EndpointsData({@required this.values});

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get casesSuspected => values[Endpoint.casesSuspected];
  EndpointData get casesConfirmed => values[Endpoint.casesConfirmed];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];

  @override
  String toString() =>
      'cases: $cases, suspected: $casesSuspected, confirmed: $casesConfirmed, recovered: $recovered, deaths: $deaths';
}
