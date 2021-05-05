import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pickeddate;
  var pickedtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Date time Picker"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  DatePicker.showTime12hPicker(context,
                      showTitleActions: true,
                      currentTime: DateTime.now(), onConfirm: (time) {
                    setState(() {
                      pickedtime =
                          "Picked time is : ${time.hour} : ${time.minute} : ${time.second}";
                    });
                  });
                },
                label: Text("Set Time"),
                icon: Icon(Icons.timer),
              ),
              SizedBox(
                height: 25,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2026, 6, 7), onChanged: (date) {
                    print('change $date');
                    setState(() {
                      pickeddate = "${date.day}";
                    });
                  }, onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      pickeddate =
                          "Picked Date is : ${date.day}/${date.month}/${date.year}";
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                label: Text("Set Date"),
                icon: Icon(Icons.date_range),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: (pickeddate == null)
                    ? Text("Select a date Please")
                    : Text("$pickeddate"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: (pickedtime == null)
                    ? Text("Select a time Please")
                    : Text("$pickedtime"),
              ),
            ],
          ),
        ));
  }
}
