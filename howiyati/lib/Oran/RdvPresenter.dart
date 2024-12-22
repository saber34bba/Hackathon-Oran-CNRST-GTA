import 'package:flutter/material.dart';

class RdvPresenter extends ChangeNotifier{
List<int> selectedItem=[];
void setShowItem(int _index){
   if(selectedItem.isNotEmpty){
    if(selectedItem.contains(_index)){
      selectedItem.removeWhere((element) => element==_index);
      notifyListeners();
    }else{
      selectedItem.add(_index);
    }
   }else{
    selectedItem.add(_index);
   }
   notifyListeners();
}

}