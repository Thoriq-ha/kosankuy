import 'package:kosankuy/app/config/route_config.dart';
import 'package:kosankuy/app/config/url_config.dart';

class Api {
  static Map route = {
    RoutesApi.LOGIN: '${UrlConfig.BASE_URL}${RoutesApi.LOGIN}',
    RoutesApi.REGISTER: '${UrlConfig.BASE_URL}${RoutesApi.REGISTER}',
  };
}
