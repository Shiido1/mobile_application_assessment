import 'package:http/http.dart' as http;
import 'package:mobile_developer_assessment/common/io/data.dart';

Future<dynamic> fetchDAta() async {
  final response = await http.get(Uri.parse('https://www.google.com'));
  if (response.statusCode == 200) {
    return Api.successResponse;
  } else {
    throw Api.errorRexponse;
  }
}


