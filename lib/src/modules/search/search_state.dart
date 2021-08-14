import 'package:flutter_ssp/src/modules/search/models/github_model.dart';

abstract class SearchGithubState {}

class SearchGithubSuccess implements SearchGithubState {
  final List<GithubModel> list;

  SearchGithubSuccess(this.list);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchGithubSuccess && other.list == list;
  }

  @override
  int get hashCode => list.hashCode;
}

class SearchGithubError implements SearchGithubState {
  final String message;
  SearchGithubError(this.message);
}

class UnexpectedError implements SearchGithubState {
  final String message;
  UnexpectedError(this.message);
}
