import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_jobs/extensions/string_extensions.dart';
import 'package:graphql_jobs/modules/job/data/models/job_favorite_key_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class JobLocalDataSource {
  const JobLocalDataSource();

  List<JobSavedKeyModel> getSavedJobKeyList();

  Future<void> removeSavedJob(JobSavedKeyModel jobSavedKey);

  Future<void> addSavedJob(JobSavedKeyModel jobSavedKey);
}

@Injectable(as: JobLocalDataSource)
class JobLocalDataSourceImpl extends JobLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const JobLocalDataSourceImpl(this._sharedPreferences);

  @override
  List<JobSavedKeyModel> getSavedJobKeyList() {
    if (!_sharedPreferences.containsKey(_savedJobKeyListKey)) {
      return [];
    }

    final rawJSONList = _sharedPreferences.getString(_savedJobKeyListKey);
    if (rawJSONList.isNullOrEmpty) return [];

    final dynamicList = json.decode(rawJSONList!) as List<dynamic>;
    return dynamicList
        .map((map) => JobSavedKeyModel.fromJson(map as Map<String, dynamic>))
        .toList(growable: false);
  }

  static const String _savedJobKeyListKey = 'favorite_job_list';

  @override
  Future<void> addSavedJob(JobSavedKeyModel jobSavedKey) {
    final savedJobKeyList = getSavedJobKeyList();
    savedJobKeyList.add(jobSavedKey);

    return _saveJobKeyList(savedJobKeyList);
  }

  @override
  Future<void> removeSavedJob(JobSavedKeyModel jobSavedKey) {
    final savedJobKeyList = getSavedJobKeyList();
    savedJobKeyList.remove(jobSavedKey);

    return _saveJobKeyList(savedJobKeyList);
  }

  Future<void> _saveJobKeyList(List<JobSavedKeyModel> jobSavedKeyList) {
    final jsonList = json.encode(
      jobSavedKeyList
          .map((element) => element.toJson())
          .toList(growable: false),
    );
    debugPrint('jsonList: $jsonList');
    return _sharedPreferences.setString(_savedJobKeyListKey, jsonList);
  }
}
