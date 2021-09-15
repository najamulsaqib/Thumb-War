import 'package:finger_battle/pages/colors.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map;
    bool winner = data['winner'];
    Future.delayed(const Duration(seconds: 2), () async {
      if (this.mounted)
        setState(() {
          Navigator.pushReplacementNamed(context, '/start_page');
        });
    });
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: winner ? MyColors.first : MyColors.second,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  winner
                      ? RotatedBox(
                        quarterTurns: 2,
                        child: Text(
                            "You Win!",
                            style: TextStyle(
                              fontSize: 60,
                              color: !winner ? MyColors.red : MyColors.green,
                              fontFamily: 'ZCOOLKuaiLe',
                            ),
                          ),
                      )
                      : RotatedBox(
                        quarterTurns: 2,
                        child: Text(
                            "You lose!",
                            style: TextStyle(
                              fontSize: 60,
                              color: !winner ? MyColors.red : MyColors.green,
                              fontFamily: 'ZCOOLKuaiLe',
                            ),
                          ),
                      ),
                  Spacer(),
                  winner
                      ? Text(
                          "You lose!",
                          style: TextStyle(
                            fontSize: 60,
                            color: !winner ? MyColors.green : MyColors.red,
                            fontFamily: 'ZCOOLKuaiLe',
                          ),
                        )
                      : Text(
                          "You Win!",
                          style: TextStyle(
                            fontSize: 60,
                            color: !winner ? MyColors.green : MyColors.red,
                            fontFamily: 'ZCOOLKuaiLe',
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
