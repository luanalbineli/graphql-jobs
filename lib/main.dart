import 'package:flutter/material.dart';
import 'package:graphql_jobs/di/injection.dart';
import 'package:graphql_jobs/modules/job/presentation/pages/job_list_page.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobListPage(),
    );
  }
}
