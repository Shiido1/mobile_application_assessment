import 'package:mobile_developer_assessment/common/io/data.dart';

import '../network/network_service.dart';
import '../network/url_path.dart';

final _service = NetworkService();

Future<dynamic> fetchData() async {
  try {
    await _service.call(
      UrlConfig.xyz,
      RequestMethod.post,
      data: {
        "email": "doctor@walexbizhost.com",
        "password": "password",
        "role": "doctor",
        "deivce_token": "devicetoken",
        "device_type": "android",
      },
    );
    return Api.successResponse;
  } catch (e) {
    return Api.errorRexponse;
  }
}

// Future<dynamic> fetchData() async {
//   try {
//     print('Starting request...');
//     Response response = await dio.get('https://dart.dev');

//     print('Got response...');
//     if (response.statusCode == 200) {
//       print('Success response');
//       return Api.successResponse;
//     } else {
//       print('Server error with status: ${response.statusCode}');
//       throw Api.errorRexponse;
//     }
//   } on DioException catch (e) {
//     // Handle Dio-specific errors like no internet, timeout, bad certs
//     if (e.type == DioExceptionType.connectionTimeout ||
//         e.type == DioExceptionType.receiveTimeout ||
//         e.type == DioExceptionType.sendTimeout) {
//       print('Request timed out.');
//       throw Api.errorRexponse;
//     } else if (e.type == DioExceptionType.badCertificate) {
//       print('Bad certificate.');
//       throw Api.errorRexponse;
//     } else if (e.type == DioExceptionType.connectionError) {
//       print('No internet connection.');
//       throw Api.errorRexponse;
//     } else {
//       print('Other Dio error: ${e.message}');
//     }
//     throw Api.errorRexponse; // Or return a custom error response
//   } catch (e) {
//     // Catch any other unexpected errors
//     print('Unexpected error: $e');
//     throw Api.errorRexponse;
//   }
// }
