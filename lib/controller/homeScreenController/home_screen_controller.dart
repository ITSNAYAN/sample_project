import 'package:flutter/cupertino.dart';
import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';
import 'package:sample_project/repository/sampleRepository/sample_repo.dart';
import 'package:sample_project/repository/sampleRepository/sample_repo_interface.dart';

class HomeScreenController extends ChangeNotifier {
  final SampleRepoInterface _sampleRepo = SampleRepo();
  List<SampleRepoModel> _getList = [];

  List<SampleRepoModel> get getList => _getList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void fetchApiData() async {
    _isLoading = true;
    try {
      _getList = await _sampleRepo.fetchSampleApi();
    } catch (e) {
      print(e.toString());
      _getList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
