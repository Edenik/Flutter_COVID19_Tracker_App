import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/app/repositories/data_repository.dart';
import 'package:flutter_covid19_app/app/services/api_service.dart';
import 'package:flutter_covid19_app/app/ui/dashbord_screen.dart';
import 'package:provider/provider.dart';

import 'app/services/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CoronaVirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}
