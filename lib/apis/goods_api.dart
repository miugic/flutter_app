import 'package:fxapp/utils/http_request.dart';
import 'package:fxapp/constants/constant.dart';

class GoodsApi{
  static recommend([Map<String,dynamic> params]) async {
    return await HttpRequest.get(Constant.SERVER_BASE_URL + "goods/recommend",params);
  }
}