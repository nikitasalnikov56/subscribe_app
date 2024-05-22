import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

abstract class AppControllers{
  //carousel
   static final CarouselController _controller = CarouselController();
    static CarouselController get controller => _controller;

    //page controller
     static final PageController _pageViewController = PageController();
   static  PageController get pageController => _pageViewController;
}