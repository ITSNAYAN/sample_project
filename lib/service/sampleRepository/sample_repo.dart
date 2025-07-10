import 'package:http/http.dart' as http;
import 'package:sample_project/model/sampleRepoModel/sample_repo_model.dart';
import 'package:sample_project/service/sampleRepoInterface/sample_repo_interface.dart';

class SampleRepo implements SampleRepoInterface {
 static const String _baseUrl = "https://jsonplaceholder.typicode.com/posts";
  @override
  Future<List<SampleRepoModel>> fetchSampleApi() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print("response.....");
      print(response.body);
      if (response.statusCode == 200) {
        return loadFromJson(response.body);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("//////");
      print(e.toString());
      return [];
    }
  }
}
