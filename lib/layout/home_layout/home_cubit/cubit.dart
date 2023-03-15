// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/layout/home_layout/home_cubit/states.dart';


class BNBCubit extends Cubit <BNBStates>{
  BNBCubit ():super(InitialState());
  static BNBCubit getObject(context) =>BlocProvider.of(context);
  int current = 0 ;
  List<Widget> screens = const[

  ];
  List<String> titles = const[
    "Business Screen",
    "Sports Screen",
    "Science Screen",
  ];


  void changeCurrent (int index){
    current = index ;
    emit(ChangeBNBState());
  }

}