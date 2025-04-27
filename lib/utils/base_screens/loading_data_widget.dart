import 'dart:io';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../hex_color.dart';

Widget loaderView() {
  return StaggeredGrid.count(
    crossAxisCount: 2,
    mainAxisSpacing: 1,
    crossAxisSpacing: 1,
    axisDirection: AxisDirection.down,
    children: [
      smallLoaderCard(),
      smallLoaderCard(),
      mediumLoaderCard(),

      smallLoaderCard(),
      smallLoaderCard(),
      mediumLoaderCard(),


    ],
  );
}

Widget smallLoaderCard(){
  return StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: (Platform.isIOS)?0.7:0.8,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: hexToColor('#FFFFFF'),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeShimmer.round(
            size: 60,
            fadeTheme: FadeTheme.light,
          ),
          SizedBox(
            height: 15,
          ),
          FadeShimmer(
            height: 8,
            width: 150,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffcbcdd0),
          ),
          SizedBox(
            height: 5,
          ),
          FadeShimmer(
            height: 8,
            width: 150,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffb5b7bb),
          ),
        ],
      ),
    ),
  );
}

Widget mediumLoaderCard(){
  return StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: (Platform.isIOS)?1:1.2,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: hexToColor('#FFFFFF'),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeShimmer.round(
            size: 60,
            fadeTheme: FadeTheme.light,
          ),
          SizedBox(
            height: 15,
          ),
          FadeShimmer(
            height: 15,
            width: 300,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
          ),
          SizedBox(
            height: 5,
          ),
          FadeShimmer(
            height: 15,
            width: 300,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
          ),
          SizedBox(
            height: 5,
          ),
          FadeShimmer(
            height: 15,
            width: 300,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
          ),
          SizedBox(
            height: 5,
          ),
          FadeShimmer(
            height: 15,
            width: 300,
            radius: 4,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
          ),


        ],
      ),
    ),
  );
}

