import 'package:flutter/cupertino.dart';

class Searchable {
   String? label;
   ValueNotifier<bool>? isSelected;

   Searchable({this.label, this.isSelected});
}