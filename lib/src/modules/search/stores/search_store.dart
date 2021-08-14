import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';

import '../../shared/utils/debounce.dart';
import '../repositories/github_repository.dart';
import '../search_state.dart';

class SearchGithubStore extends MobXStore<SearchGithubError, SearchGithubSuccess> implements Disposable {
  final GithubRepository repository;

  SearchGithubStore(this.repository) : super(SearchGithubSuccess([]));

  Future<void> searchGithub(String text) async {
    setLoading(true);

    try {
      Debounce.debounce('github-search', Duration(milliseconds: 500), () async {
        final data = await repository.search(text);
        update(SearchGithubSuccess(data ?? []));
      });
    } on SearchGithubError catch (error) {
      setError(error);
    } catch (error) {
      setError(SearchGithubError('Erro Interno'));
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    Debounce.cancel('github-search');
  }
}
