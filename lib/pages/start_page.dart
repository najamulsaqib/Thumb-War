import 'package:finger_battle/pages/play_ground.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Image.asset(
                  "images/bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _flag = false;
                  });
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => PlayGround()),
                        ModalRoute.withName("/play_ground"));
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: _flag
                        ? Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ZCOOLKuaiLe',
                            ),
                          )
                        : Image.asset(
                            "images/counter.gif",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
