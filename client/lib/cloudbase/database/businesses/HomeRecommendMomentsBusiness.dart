import 'package:flutter/widgets.dart';
import 'package:snsmax/cloudbase/commands/QueryRecommendMomentsCommand.dart';

class HomeRecommendMomentsBusiness with ChangeNotifier {
  static HomeRecommendMomentsBusiness _instance;

  Iterable<String> _ids;
  Iterable<String> get ids => _ids ?? [];

  HomeRecommendMomentsBusiness._();

  factory HomeRecommendMomentsBusiness() {
    if (_instance is! HomeRecommendMomentsBusiness) {
      _instance = HomeRecommendMomentsBusiness._();
    }

    return _instance;
  }

  bool get isEmpty => ids?.isEmpty ?? true;

  Future<int> refresh() async {
    _ids = await QueryRecommendMomentsCommand.run(0);

    notifyListeners();

    return ids.length;
  }

  Future<int> loadMore() async {
    final ids = await QueryRecommendMomentsCommand.run(this.ids?.length ?? 0);

    _ids = this.ids.toList()
      ..addAll(ids)
      ..toSet();

    notifyListeners();

    return ids.length;
  }
}
