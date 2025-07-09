import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';

abstract class SampleRepoInterface {
    Future<List<SampleRepoModel>> fetchSampleApi();
}