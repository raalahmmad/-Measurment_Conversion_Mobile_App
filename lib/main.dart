import 'package:flutter/material.dart';

main(List<String> args) {
  return runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hello World Travel Title",
        home: Scaffold(
            appBar: AppBar(title: Text("Hello World Travel App")),
            body: Center(child: Text('Hello World Travel'))));
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ctx = context;
    return MaterialApp(
        title: "My App",
        home: Scaffold(
            appBar: AppBar(
              title: Text('Raed App'),
              backgroundColor: Colors.deepPurple,
            ),
            body: Builder(
                builder: (context) => Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Here we go ...',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('second line'),
                        Image.network(
                          'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                          height: 350,
                        ),
                        RaisedButton(
                          child: Text('Contact us'),
                          onPressed: () => contactUs(context),
                        )
                      ],
                    )))));
  }

  void contactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hello@raed.com'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}
