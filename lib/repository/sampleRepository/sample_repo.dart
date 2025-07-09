import 'package:http/http.dart' as http;
import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';
import 'package:sample_project/repository/sampleRepository/sample_repo_interface.dart';

class SampleRepo implements SampleRepoInterface {
  @override
  Future<List<SampleRepoModel>> fetchSampleApi() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        print(response);
        return loadFromJson(response.body);
      } else {
        return [];
        // throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
