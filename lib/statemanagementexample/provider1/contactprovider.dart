import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../modelclass/contactclass.dart';



final List<Contact> data=List.generate(100, (index) => Contact(name:"Contact $index",
    number:"${Random().nextInt(0123456789)+1} "));


class ContactProvider with ChangeNotifier{


  final List<Contact> contactHome=data;

  List<Contact> get contacts=>contactHome;

  final List<Contact>favourites=[];

  List<Contact> get favouritecontacts=>favourites;


  void addToList(Contact movie){


    favouritecontacts.add(movie);
    notifyListeners();


  }
  void removeFromList(Contact movie){
    favouritecontacts.remove(movie);
    notifyListeners();


  }
}