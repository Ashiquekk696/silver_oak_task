import 'package:silver_oak_test/config.dart';
import 'package:silver_oak_test/constants/endpoints.dart';
import 'package:silver_oak_test/helpers/api_base_helper.dart';
import 'package:silver_oak_test/models/home_model.dart';

class HomeService {
  Future<List<HomeModel>> fetchItems(page) async {
    var _helper = ApiBaseHelper();
    List<HomeModel> myGridData = [];
    final response = await _helper.get(
   "${ApiEndpoints.photos}?client_id=${AppConfig.ACCESS_TOKEN}&page=$page");
    response['body'].forEach((e) {
      myGridData.add(HomeModel.fromJson(e));
    });
    return myGridData;
  }
}
