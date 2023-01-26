import 'package:ditonton/common/show_type.dart';
import 'package:flutter/cupertino.dart';

class HomeNotifier extends ChangeNotifier {
  ShowType _selectedShowType = ShowType.movie;
  ShowType get selectedShowType => _selectedShowType;

  void setSelectedShowType(ShowType showType) {
    this._selectedShowType = showType;
    notifyListeners();
  }
}
