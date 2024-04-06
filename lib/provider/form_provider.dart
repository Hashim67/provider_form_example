import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier{
  
  String _userName='';
  String get userName=>_userName;
   void addUserName(String value){
  _userName=value;
  notifyListeners();
  }
  final List<String> _genderItems = ['Male', 'Female', 'Others'];
  String _selectedItem='';
  List<String> get genderItems => _genderItems;
  String get selectedItem=>_selectedItem;
  
 
  void setSelectGender(String value){
    _selectedItem=value;
    notifyListeners();
  }

  // bool _selectedMuslim = false;
  // bool get selectedMuslim=>_selectedMuslim;
  // bool _selectedNonMuslim = false;
  // bool get selectedNonMuslim=>_selectedNonMuslim;
  // void selectMuslimData(bool val){
  //   _selectedMuslim=val;
  // }
  //   void selectNonMuslimData(bool val){
  //   _selectedNonMuslim=val;
  // }
  var religion='';
  bool selectedMuslim = false;
  bool selectedNonMuslim = false;
  String religionItems1 = 'Muslim';
  String religionItems2 = 'Non Muslim';
  void religionData(){
                            if (selectedMuslim == true) {
                          religion = religionItems1.toString();
                        } else if (selectedNonMuslim == true) {
                          religion = religionItems2.toString();
                        } else
                          null;
                           notifyListeners();
  }
    void toggleCheckbox(int checkboxNumber) {
    
      if (checkboxNumber == 1) {
        selectedMuslim = !selectedMuslim;
        if (selectedMuslim) selectedNonMuslim = false;
      } else {
        selectedNonMuslim = !selectedNonMuslim;
        if (selectedNonMuslim) selectedMuslim = false;
      }
       notifyListeners();
    
  }

}