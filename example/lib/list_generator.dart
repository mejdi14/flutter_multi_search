import 'package:example/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<ImageView> getImages(){
  return [
    ImageView('bear', Image.asset('assets/bear.jpeg', fit: BoxFit.cover)),
    ImageView('dab', Image.asset('assets/dab.jpeg', fit: BoxFit.cover)),
    ImageView('fall', Image.asset('assets/fall.png', fit: BoxFit.cover)),
    ImageView('fox', Image.asset('assets/fox.jpeg', fit: BoxFit.cover)),
    ImageView('gorilla', Image.asset('assets/gorilla.png', fit: BoxFit.cover)),
    ImageView('scream', Image.asset('assets/scream.jpeg', fit: BoxFit.cover)),
    ImageView('search', Image.asset('assets/search.png', fit: BoxFit.cover)),
    ImageView('tarazan', Image.asset('assets/tarazan.png', fit: BoxFit.cover)),

  ];
}