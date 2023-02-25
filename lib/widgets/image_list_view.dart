import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class ImageViewList extends StatefulWidget {
  const ImageViewList({Key? key, required this.startIndex}) : super(key: key);
  final int startIndex;

  @override
  State<ImageViewList> createState() => _ImageViewListState();
}

class _ImageViewListState extends State<ImageViewList> {
  final scrollController = ScrollController();

  void autoScroll() {
    final currentScrollPosition = scrollController.offset;
    final scrollEndPosition = scrollController.position.maxScrollExtent;
    print(currentScrollPosition);
    print(scrollEndPosition);
    scheduleMicrotask(() {
      scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 5), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(!scrollController.position.atEdge){
        autoScroll();
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        autoScroll();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.60,
        child: ListView.builder(
          controller: scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: imgList[widget.startIndex + index],
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  margin: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                    top: 10.0
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    )
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

}
