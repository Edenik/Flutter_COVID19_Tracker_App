import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/app/services/api_service.dart';

import 'app/services/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  int _cases;
  int _deaths;

  void _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.cases);
    final deaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.deaths);
    setState(() {
      _accessToken = accessToken;
      _cases = cases;
      _deaths = deaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AccessToken:',
            ),
            Text(
              '$_accessToken',
            ),
            if (_cases != null)
              Row(
                children: <Widget>[
                  Text(
                    'Cases:',
                  ),
                  Text(
                    '$_cases',
                  ),
                ],
              ),
            if (_deaths != null)
              Row(
                children: <Widget>[
                  Text(
                    'Deaths:',
                  ),
                  Text(
                    '$_deaths',
                  ),
                ],
              )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
