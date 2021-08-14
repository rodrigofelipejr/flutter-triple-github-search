import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'search_state.dart';
import 'stores/search_store.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchGithubStore> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: store.searchGithub,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquise...",
              ),
            ),
          ),
          Expanded(
            child: ScopedBuilder.transition(
              store: store,
              onLoading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              onError: (_, SearchGithubError? e) => Text(
                '${e?.message}',
                style: TextStyle(color: Colors.red),
              ),
              onState: (_, SearchGithubSuccess state) => state.list.isEmpty
                  ? Center(child: Text('Sem resultados'))
                  : ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (_, index) {
                        var item = state.list[index];
                        return ListTile(
                          leading: Hero(
                            tag: item.image,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(item.image),
                            ),
                          ),
                          title: Text(item.nickname),
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
