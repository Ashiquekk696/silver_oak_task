import 'package:silver_oak_test/config.dart';
import 'package:silver_oak_test/constants/endpoints.dart';
import 'package:silver_oak_test/helpers/api_base_helper.dart';
import 'package:silver_oak_test/models/my_grid_model.dart';

class MyHomeService {
  Future< List<MyGridModel>>fetchItems(page) async {
    var _helper = ApiBaseHelper();
    List<MyGridModel> myGridData = [];
    final response = await _helper
        .get("${ApiEndpoints.photos}?client_id=${AppConfig.ACCESS_TOKEN}&page=$page");
    if (response['statusCode'] == 200) {
      response['body'].forEach((e) {
        myGridData.add(MyGridModel.fromJson(e));
      }); 
    } else {
      throw Exception('Failed to load items');
    }
    return myGridData;
  }
}
