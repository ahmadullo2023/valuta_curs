import 'dart:convert';
import '../../../common/constants/api_constants.dart';
import '../../../common/services/app_service.dart';
import '../models/conv_model.dart';

abstract interface class ApiRepository {
  const ApiRepository();

  Future<List<ConvertedModel>> getAllModel();
  Future<ConvertedModel> getCurrencyByCcy({required String ccy, String? date});

}

class PostRepository implements ApiRepository {
  final APIService apiService;

  const PostRepository(this.apiService);

  // Hamma ma'lumotni olish
  @override
  Future<List<ConvertedModel>> getAllModel() async {
    String response = await apiService.request(APIConst.allusersPath);

    // jsonDecode(response) => dynamic as List
    // List.from(Iterable<dynamic> list) => List<dynamic>
    // List<Map<String, Object?>>.from(Iterable<dynamic> list) => List<Map<String, Object?>> list
    // list.map((e) => ConvertedModel.fromJson(e)).toList();

    return List<Map<String, Object?>>.from(jsonDecode(response) as List)
        .map(ConvertedModel.fromJson)
        .toList();
  }

  @override
  Future<ConvertedModel> getCurrencyByCcy({required String ccy, String? date})async {
    String response = await apiService.request(APIConst.getCurrencyByCcy(ccy: ccy, date: date));

    // jsonDecode(response) => dynamic as List
    // List.from(Iterable<dynamic> list) => List<dynamic>
    // List<Map<String, Object?>>.from(Iterable<dynamic> list) => List<Map<String, Object?>> list

    // return  ConvertedModel.fromJson(list.first);
    return ConvertedModel.fromJson( List<Map<String, Object?>>.from(jsonDecode(response) as List).first);

  }

}

