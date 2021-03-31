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
  int next = 0;
  bool checkFibonacci;
  bool checkPrime;
  int _prime = 0;
  List<int> listFibonacci = [];
  @override
  void initState() {
    _getfibonacci(_fibonacci);
    _getPrime(_prime);
    super.initState();
  }

  void _incrementCounter() { // กด button แล้ว +เลข
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
    for (i = 2; i <= prime - 1; i++) { // check ว่าเลขหารอะไรลงตัวบ้าง เริ่มจาก 2 เพราะ ถ้าเป็น 1 มันจะถูกทั้งหมด
      if (prime % i == 0) { // มีเลขที่หารลงตัว == ไม่ใช่ Prime number
        setState(() {
          checkPrime = false;
        });
        break;
      } else {
        setState(() {
          checkPrime = true;
        });
      }
    }
  }

  void _getfibonacci(int fibonacci) { 
    listFibonacci.add(n1);
    while (fibonacci >= next) { // check เลข fibonacci จนถึงเลขที่กดอยู่
      n1 = n2;
      n2 = next;
      next = n1 + n2; 
      listFibonacci.add(next); // add เข้า list เพราะจะเอามา check ต่อ 
    }
    if (listFibonacci.contains(fibonacci)) { // check ว่า เลขที่กดอยู่ อยู่ใน List fibonacci หรือป่าว 
      setState(() {
        checkFibonacci = true;
      });
    } else {
      setState(() {
        checkFibonacci = false;
      });
    }
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
                color:
                    (checkFibonacci == true) ? Colors.lightGreenAccent : Colors.white,
                onPressed: _incrementCounter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_fibonacci'),
                    (checkFibonacci == true)
                        ? Text('This number is fibonacci number')
                        : Text('This number is not fibonacci number')
                  ],
                ),
              ),
            )),
            Expanded(
                child: Container(
              width: double.infinity,
              child: RaisedButton(
                color: (checkPrime == true) ? Colors.lightGreenAccent : Colors.white,
                onPressed: _incrementCounter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_prime'),
                    (checkPrime == true)
                        ? Text('This number is prime number')
                        : Text('This number is not prime number')
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
