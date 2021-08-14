import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/repositories/github_repository.dart';
import 'modules/search/search_page.dart';
import 'modules/search/stores/search_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Dio()),
        Bind.factory((i) => GithubRepositoryImpl(i())),
        Bind.singleton((i) => SearchGithubStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SearchPage()),
      ];
}
