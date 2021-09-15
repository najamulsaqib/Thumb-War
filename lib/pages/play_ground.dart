import 'dart:ui';
import 'package:flutter/material.dart';
import 'colors.dart';

// ! Screen Dimensions
var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalHeight = logicalScreenSize.height - 32;
var single_value = logicalHeight / 50;
var first_player = single_value * 25;
var second_player = single_value * 25;
// ! Flag
bool flag = true;

class PlayGround extends StatefulWidget {

  @override
  PlayGroundState createState() => PlayGroundState();
}

class PlayGroundState extends State<PlayGround> {
  @override
  Widget build(BuildContext context) {
    if (first_player < 1 || second_player < 1) {
      Future.delayed(Duration.zero, () async {
        // setState(() {
        //   flag = false;
        // });
        Navigator.pushReplacementNamed(context, '/results',
            arguments: {'winner': first_player > second_player});

        first_player = single_value * 25;
        second_player = single_value * 25;
      });
    }
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.grey,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    color: MyColors.first,
                    height: first_player,
                  ),
                  onTap: () {
                    flag
                        ? setState(() {
                            first_player = first_player + single_value;
                            if ((second_player - single_value) > 0) {
                              second_player = second_player - single_value;
                            } else {
                              second_player = 0.0;
                            }
                          })
                        : null;
                  },
                ),
                InkWell(
                  child: Container(
                    color: MyColors.second,
                    height: second_player,
                  ),
                  onTap: () {
                    flag
                        ? setState(() {
                            second_player = second_player + single_value;
                            if ((first_player - single_value) > 0) {
                              first_player = first_player - single_value;
                            } else {
                              first_player = 0.0;
                            }
                          })
                        : null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
