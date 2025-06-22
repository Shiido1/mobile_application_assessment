import 'package:http/http.dart' as http;
import 'package:mobile_developer_assessment/common/io/data.dart';

Future<dynamic> fetchDAta() async {
  final response = await http.get(Uri.parse('https://www.google.com'));
   print('vvvvvvvvre');
  if (response.statusCode == 200) {
    print('me here');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Api.successResponse;
  } else {
    print('me errororor');
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Api.errorRexponse;
  }
}


