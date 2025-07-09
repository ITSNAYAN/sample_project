import 'package:flutter/cupertino.dart';
import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';
import 'package:sample_project/service/sampleRepoInterface/sample_repo_interface.dart';

class HomeScreenController extends ChangeNotifier {
  SampleRepoInterface _sampleRepoInterface;
  HomeScreenController(this._sampleRepoInterface);
  List<SampleRepoModel> _apiData = [];
  List<SampleRepoModel> get apiData =>_apiData;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getAllApiData() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    _apiData = await _sampleRepoInterface.fetchSampleApi();
    _isLoading = false;
    notifyListeners();
  }
}
