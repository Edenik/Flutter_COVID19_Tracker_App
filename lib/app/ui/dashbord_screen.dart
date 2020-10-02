import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/app/repositories/endpoints_data.dart';
import 'package:flutter_covid19_app/app/services/api.dart';
import 'package:flutter_covid19_app/app/ui/endpoint_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_covid19_app/app/repositories/data_repository.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    _updateData();
    super.initState();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndPointData();
    setState(() => _endpointsData = endpointsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coronavirus Tracker'),
        ),
        body: RefreshIndicator(
          onRefresh: _updateData,
          child: ListView(
            children: <Widget>[
              for (var endpoint in Endpoint.values)
                EndpointCard(
                  endpoint: endpoint,
                  value: _endpointsData != null
                      ? _endpointsData.values[endpoint]
                      : null,
                )
            ],
          ),
        ));
  }
}
