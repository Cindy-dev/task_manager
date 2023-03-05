import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimePickerImpl extends StatefulWidget {
  const CupertinoTimePickerImpl({Key? key}) : super(key: key);

  @override
  State<CupertinoTimePickerImpl> createState() =>
      _CupertinoTimePickerImplState();
}

class _CupertinoTimePickerImplState extends State<CupertinoTimePickerImpl> {
  Duration initialtimer = new Duration();

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double? height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }
  @override
  Widget build(BuildContext context) {
    String? time;
    Widget timePicker() {
      return CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: initialtimer,
        onTimerDurationChanged: (Duration changedtimer) {
          setState(() {
            initialtimer = changedtimer;
            time = changedtimer.inHours.toString() +
                ' hrs ' +
                (changedtimer.inMinutes % 60).toString() +
                ' mins ' +
                (changedtimer.inSeconds % 60).toString() +
                ' secs';
          });
        },
      );
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // button(
              //   "Cupertino Timer Picker",
              //   color: Colors.green,
              //   onPressed: () {
              //     bottomSheet(context, timePicker());
              //   },
              // ),
              // time == null ? Container() : Text('$time'),
            ],
          ),
        ),
      ),
    );
  }
}

class Impl{
  String? time;
  Duration initialtimer = new Duration();

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double? height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }

  Widget timePicker(void Function(Duration) onTimer) {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: onTimer,
    );
  }


}
