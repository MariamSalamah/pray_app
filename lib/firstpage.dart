

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {

  Widget _salahDate (String time, String midday, String name){
    return Container(
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: background.evaluate(
                  AlwaysStoppedAnimation(_controller.value/1.5)),
            width: 3,
                    ),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Text(time , style: TextStyle(color: Colors.white , fontSize: 35),),
              Text(midday,style: TextStyle(color: Colors.white),),

            ],
          ),
          Text(name,textAlign: TextAlign.right,style: TextStyle(color: Colors.white, fontSize: 30),),
        ],
      ),
    );
  }
  @override
  late AnimationController _controller;


  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }
  Animatable background = TweenSequence([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color.fromRGBO(36,62,101, 1),
        end: Color.fromRGBO(86,49,81, 1),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(

        begin: Color.fromRGBO(86,49,81, 1),
        end: Color.fromRGBO(45,70,94, 1),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color.fromRGBO(45,70,94, 1),
        end: Color.fromRGBO(83,52,90, 1),
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color.fromRGBO(83,52,90, 1),
        end: Color.fromRGBO(100,34,70, 1),
      ),
    ),
  ]);

  int hours = 03;
  int mins = 52;
  int sec = 48;



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (context,child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(39,167,205, 1),
          leading: Icon(Icons.compass_calibration_outlined),
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text("الاثنين 9 ذو الحجة 1442"),
          ),

          actions: [
            Icon(Icons.menu),
          ],
        ),

        body: Container(

          color: background.evaluate(
              AlwaysStoppedAnimation(_controller.value)),
          child: Column(
            children: [


              Image(image: AssetImage('assets/images/kaba.jpg')),


              _salahDate("03:30", "Am", "الفجر"),
              _salahDate("05:08", "Am", "الشروق"),
              _salahDate("12:06", "Pm", "الضهر"),
              _salahDate("03:45", "Pm", "العصر"),
              _salahDate("07:03", "Pm", "المغرب"),
              _salahDate("08:23", "Pm", "العشاء"),
              
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("0$hours" , style: TextStyle(color: Colors.white , fontSize: 50),),
                   Text("H",style: TextStyle(color: Colors.white),),
                   Text("$mins" , style: TextStyle(color: Colors.white , fontSize: 50),),
                   Text("m",style: TextStyle(color: Colors.white),),
                   Text("$sec" , style: TextStyle(color: Colors.white , fontSize: 50),),
                   Text("S",style: TextStyle(color: Colors.white),),

                 ],
               ),

        Container(
          color: Colors.blue,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Text("03:30" , style: TextStyle(color: Colors.white ),),
                  Text("Am",style: TextStyle(color: Colors.white),),

                ],
              ),
              Text("الفجر",textAlign: TextAlign.right,style: TextStyle(color: Colors.white),),
            ],
          ),
        )


            ],
          ),
        ),
      );
    });
  }
}
