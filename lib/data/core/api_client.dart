import 'package:dio/dio.dart';
import 'package:news_ui/data/core/api_constants.dart';

class APIClient {

  static Dio dio = Dio();

  dynamic getResource() async {

    String url = APIConstants.baseURL;
    // print('url is:\t$url');

    try {
      var response = await dio.get(url);
      if(response.statusCode == 200){
        // print(response.data);
        return response.data;
      } else {
        return response.data.toString();
      }
    } on DioError catch (e) {
      final dioError = e;
      switch (dioError.type) {
        case DioErrorType.cancel:
          return 'Request was cancelled';
        case DioErrorType.response:
          return dioError.response!.data;
        case DioErrorType.connectTimeout:
          return 'Connection timed out';
        case DioErrorType.other:
          return 'Could not ascertain the cause of this error';
        case DioErrorType.sendTimeout:
          return 'Request sent to server timed out';
        case DioErrorType.receiveTimeout:
          return 'Response from server timed out';
      }
    }
  }

}