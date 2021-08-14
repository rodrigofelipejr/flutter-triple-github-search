import 'package:dio/dio.dart';

import '../models/github_model.dart';
import '../search_state.dart';

abstract class GithubRepository {
  Future<List<GithubModel>?> search(String textSearch);
}

class GithubRepositoryImpl implements GithubRepository {
  final Dio dio;

  GithubRepositoryImpl(this.dio);

  @override
  Future<List<GithubModel>?> search(String text) async {
    try {
      final response = await dio.get("https://api.github.com/search/users?q=${text.trim().replaceAll(' ', '+')}");
      return (response.data['items'] as List)
          .map((item) => GithubModel(
                name: '',
                nickname: item['login'],
                image: item['avatar_url'],
                url: item['url'],
              ))
          .toList();
    } on DioError catch (e) {
      throw SearchGithubError(e.error);
    } catch (e) {
      throw UnexpectedError(e.toString());
    }
  }
}
