import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

CarouselOptions buildCarouselOptions({initialPage, onPageChanged}) {
  return CarouselOptions(
    height: 160,
    aspectRatio: 16 / 9,
    viewportFraction: 0.8,
    initialPage: initialPage,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 0.3,
    onPageChanged: onPageChanged,
    scrollDirection: Axis.horizontal,
  );
}
