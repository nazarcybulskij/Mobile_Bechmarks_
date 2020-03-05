
import 'package:SuperPi/pi_calculator.dart';
import 'package:flutter/material.dart';
import 'common.dart';
import 'package:flutter/widgets.dart';

const int _kNumIters = 100;


void main() {
    runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String time = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: RaisedButton(
              child: Text(time),
              onPressed: (){
                //var startdate = DateTime.now().millisecondsSinceEpoch;
                final Stopwatch watch = Stopwatch();
                print('Pi calc tracker benchmark...');
                watch.start();
                PiCalculator  calc =  PiCalculator();
                for (int i = 0; i < _kNumIters; i += 1) {
                  //calc.getOneByPi(100000000);
                  calc.getOneByPi(1000000);
                }
                watch.stop();
                //var finishDate = DateTime.now().millisecondsSinceEpoch;
                final BenchmarkResultPrinter printer = BenchmarkResultPrinter();
                printer.addResult(
                  description: 'Pi calc tracker',
                  value: watch.elapsedMicroseconds / _kNumIters,
                  //value: (finishDate - startdate)/_kNumIters,
                  unit: 'µs per iteration',
                  name: 'iteration',
                );
                printer.printToStdout();
                setState(() {
                  time ='${watch.elapsedMicroseconds / _kNumIters}';
                  //time ='${(finishDate - startdate)/_kNumIters}';
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
