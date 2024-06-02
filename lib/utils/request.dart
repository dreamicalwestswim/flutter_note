import 'package:get/get.dart';

class Request extends GetConnect {
  @override
  void onInit() {

    /// 前缀地址
    httpClient.baseUrl = 'https://api.covid19api.com';

    /// 超时时长
    httpClient.timeout = const Duration(seconds: 60);

    /// 添加请求时额外附带的参数
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });


    /// 添加拿到数据后的额外逻辑
    httpClient.addResponseModifier<dynamic>((request, response) {
      print(response);
    });

  }
}