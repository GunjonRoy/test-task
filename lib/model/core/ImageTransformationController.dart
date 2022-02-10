
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageTransformationController{


  TransformationController? controller;

  void initTransFormationState(){
    controller= TransformationController();
  }

  void disposeTransformation(){
    controller!.dispose();
  }

  void setControllerValue(var value){
    controller!.value=value;
  }


}