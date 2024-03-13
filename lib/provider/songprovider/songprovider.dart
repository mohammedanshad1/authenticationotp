import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/songmodel.dart';





final List<Song> data=List.generate(100, (index) => Song(song:"Song $index",
    time:"${Random().nextInt(100)+60}minute"));


class SongProvider with ChangeNotifier{


  final List<Song> favouriteHome=data;

  List<Song> get songs=>favouriteHome;

  final List<Song>favourites=[];

  List<Song> get favouritesongs=>favourites;


  void addToList(Song name){


    favouritesongs.add(name);
    notifyListeners();


  }
  void removeFromList(Song name){
    favouritesongs.remove(name);
    notifyListeners();


  }
}