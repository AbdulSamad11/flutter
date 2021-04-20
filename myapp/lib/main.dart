import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Primer'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Abdul Samad',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontFamily: 'OpenSansCondensed-Bold',
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Integer',
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: Text('Calculate'),
                            onPressed: () {
                              String num = '';
                              int x = int.parse(nameController.text);
                              if (x == 2 ||
                                  x == 3 ||
                                  (x % 2 != 0 && x % 3 != 0 && x > 2))
                                num = 'Prime';
                              else if (x % 2 == 0 || x % 3 == 0)
                                num = 'Composite';

                              for (int i = 5; i * i <= x; i = i + 6)
                                if (x % i == 0 || x % (i + 2) == 0)
                                  num = 'Composite';

                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Your Number is"),
                                    content: Text(num),
                                    actions: <Widget>[
                                      new ElevatedButton(
                                        child: new Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          ElevatedButton(
                            child: Text('Help'),
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("How it works?"),
                                    content: Text(
                                        'You have to enter a Number\nYou will get to know if a number is Prime or Composite'),
                                    actions: <Widget>[
                                      new ElevatedButton(
                                        child: new Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
