import 'dart:convert';

import 'package:graphql_jobs/extensions/string_extensions.dart';
import 'package:graphql_jobs/modules/job/data/models/saved_job_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class JobLocalDataSource {
  const JobLocalDataSource();

  List<SavedJobKeyModel> getSavedJobKeyList();

  Future<void> removeSavedJob(SavedJobKeyModel jobSavedKey);

  Future<void> addSavedJob(SavedJobKeyModel jobSavedKey);
}

@Injectable(as: JobLocalDataSource)
class JobLocalDataSourceImpl extends JobLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const JobLocalDataSourceImpl(this._sharedPreferences);

  @override
  List<SavedJobKeyModel> getSavedJobKeyList() {
    if (!_sharedPreferences.containsKey(_savedJobKeyListKey)) {
      return [];
    }

    final rawJSONList = _sharedPreferences.getString(_savedJobKeyListKey);
    if (rawJSONList.isNullOrEmpty) return [];

    final dynamicList = json.decode(rawJSONList!) as List<dynamic>;
    return dynamicList
        .map((map) => SavedJobKeyModel.fromJson(map as Map<String, dynamic>))
        .toList();
  }

  static const String _savedJobKeyListKey = 'favorite_job_list';

  @override
  Future<void> addSavedJob(SavedJobKeyModel jobSavedKey) {
    final savedJobKeyList = getSavedJobKeyList();
    savedJobKeyList.add(jobSavedKey);

    return _saveJobKeyList(savedJobKeyList);
  }

  @override
  Future<void> removeSavedJob(SavedJobKeyModel jobSavedKey) {
    final savedJobKeyList = getSavedJobKeyList();
    savedJobKeyList.remove(jobSavedKey);

    return _saveJobKeyList(savedJobKeyList);
  }

  Future<void> _saveJobKeyList(List<SavedJobKeyModel> jobSavedKeyList) {
    final jsonList = json.encode(
      jobSavedKeyList
          .map((element) => element.toJson())
          .toList(growable: false),
    );
    return _sharedPreferences.setString(_savedJobKeyListKey, jsonList);
  }
}
