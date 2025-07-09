import 'package:flutter/cupertino.dart';

class FavController extends ChangeNotifier{
 final List<int> _itemId =[];
 List<int> get itemId => _itemId;
 bool isFav (int id ){
   return _itemId.contains(id);
 }
 void onTapFav(int id){
   if (_itemId.contains(id)){
     _itemId.remove(id);
   }else {
     _itemId.add(id);
   }
   notifyListeners();
 }
}