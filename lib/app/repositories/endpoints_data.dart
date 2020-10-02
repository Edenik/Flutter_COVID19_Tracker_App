import 'package:flutter/foundation.dart';
import 'package:flutter_covid19_app/app/services/api.dart';

class EndpointsData {
  final Map<Endpoint, int> values;
  EndpointsData({@required this.values});

  int get cases => values[Endpoint.cases];
  int get casesSuspected => values[Endpoint.casesSuspected];
  int get casesConfirmed => values[Endpoint.casesConfirmed];
  int get deaths => values[Endpoint.deaths];
  int get recovered => values[Endpoint.recovered];

  @override
  String toString() =>
      'cases: $cases, suspected: $casesSuspected, confirmed: $casesConfirmed, recovered: $recovered, deaths: $deaths';
}
