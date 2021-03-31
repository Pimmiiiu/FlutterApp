import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _fibonacci = 0;
  int n1 = 0;
  int n2 = 1;
  bool check;
  bool checkPrime;
  int _prime = 0;
  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _fibonacci++;
      _getfibonacci(_fibonacci);
      _prime++;
      _getPrime(_prime);
    });
  }

  void _getPrime(prime) {
    int i;
    if (prime == 2) {
        setState(() {
          checkPrime = true;
        });
      }
    for (i = 2; i <= prime - 1; i++) {
      if (prime % i == 0) {
        setState(() {
          checkPrime = false;
        });
        break;
      }
       else {
        setState(() {
          checkPrime = true;
        });
      }
    }
  }

  void _getfibonacci(int fibonacci) {
    setState(() {
      if (fibonacci == 0 || fibonacci == 1) {
        check = true;
      } else {
        n1 = fibonacci - 2;
        n2 = fibonacci - 1;
        // print(fibonacci == (n1 + n2));
        if (fibonacci == (n1 + n2)) {
          check = true;
        } else {
          check = false;
        }
      }
      // check = n1 + n2;
      // n1 = n2;
      // n2 = check;
      // print(check);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              child: RaisedButton(
                color: (check == true) ? Colors.lightGreen : Colors.white,
                onPressed: _incrementCounter,
                child: Text('$_fibonacci'),
              ),
            )),
            Expanded(
                child: Container(
              width: double.infinity,
              child: RaisedButton(
                color: (checkPrime == true) ? Colors.lightGreen : Colors.white,
                onPressed: _incrementCounter,
                child: Text('$_prime'),
              ),
            ))
          ],
        ));
  }
}
