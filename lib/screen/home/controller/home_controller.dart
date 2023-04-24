import 'package:flutter/material.dart';
import 'package:task_2/screen/home/modal/home_modal.dart';

class HomeProvider extends ChangeNotifier
{
  List toDo = [HomeModal(cate: "Tution",task: "Write Program")];
  List done = [];
}