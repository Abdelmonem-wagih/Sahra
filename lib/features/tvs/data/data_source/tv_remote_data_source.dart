import 'package:dio/dio.dart';
import 'package:sahar/core/exception/exception.dart';
import 'package:sahar/core/network/error_message_model.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/tvs/data/models/recommendation_tv_model.dart';
import 'package:sahar/features/tvs/data/models/tv_details_model.dart';
import 'package:sahar/features/tvs/data/models/tv_model.dart';
import 'package:sahar/features/tvs/domain/usecase/get_recommendation_tv_usecase.dart';
import 'package:sahar/features/tvs/domain/usecase/get_tv_details_usecase.dart';

abstract class BaseTVsRemoteDataSource {
  Future<List<TVsModel>> getOnTheAir();

  Future<List<TVsModel>> getPopularTVs();

  Future<List<TVsModel>> getTopRatedTVs();

  Future<TVsDetailsModel> getTVsDetails(TVsDetailsParameter parameter);

  Future<List<RecommendationTVsModel>> getRecommendation(
      RecommendationTVsParameters parameter);
}

class TVsRemoteDataSource extends BaseTVsRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<List<TVsModel>> getOnTheAir() async {
    final response = await dio.get(AppConstance.onTheAirTVsPath);
    if (response.statusCode == 200) {
      //how it work?? google it??
      return List<TVsModel>.from(
        (response.data["results"] as List).map((e) => TVsModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJason(response.data),
      );
    }
  }

  @override
  Future<List<TVsModel>> getPopularTVs() async {
    final response = await  Dio().get(AppConstance.popularTVsPath);
    if (response.statusCode == 200) {
      return List<TVsModel>.from(
        (response.data['results'] as List).map((e) => TVsModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJason(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationTVsModel>> getRecommendation(
      RecommendationTVsParameters parameter) async {
    final response = await dio.get(AppConstance.recommendation(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationTVsModel>.from(
        (response.data['results'] as List)
            .map((e) => RecommendationTVsModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJason(response.data),
      );
    }
  }

  @override
  Future<TVsDetailsModel> getTVsDetails(TVsDetailsParameter parameter) async {
    final response =
        await Dio().get(AppConstance.tvDetailsPath(parameter.seriesId));
    if (response.statusCode == 200) {
      return TVsDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJason(response.data),
      );
    }
  }

  @override
  Future<List<TVsModel>> getTopRatedTVs() async {
    final response = await Dio().get(AppConstance.topRatedTVsPath);
    if (response.statusCode == 200) {
      return List<TVsModel>.from(
        (response.data["results"] as List).map((e) => TVsModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJason(response.data),
      );
    }
  }
}
