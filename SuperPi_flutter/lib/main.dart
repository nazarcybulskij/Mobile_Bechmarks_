
import 'package:SuperPi/pi_calculator.dart';
import 'package:flutter/material.dart';
import 'common.dart';
import 'package:flutter/widgets.dart';

const int _kNumIters = 100;

const int  _gaussLegendreIterats  = 10000000;

const int  _borweinIterats  = 1000000;

void main() {
    runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String gaussLegendreTime = '';
  String borweinTime = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                child: Text('Gauss-Legendre'),
                onPressed: pressGaussLegendreButton
              ),

              Text('$gaussLegendreTime µs per iteration'),

              RaisedButton(
                  child: Text('Borwein'),
                  onPressed: pressBorweinButton
              ),
              Text('$borweinTime µs per iteration'),


            ],
          ),
        ),
      ),
    );
  }

  pressGaussLegendreButton(){
    //var startdate = DateTime.now().millisecondsSinceEpoch;
    final Stopwatch watch = Stopwatch();
    print('Pi calc tracker benchmark...');
    watch.start();
    runGaussLegendreTest();
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
      gaussLegendreTime ='${watch.elapsedMicroseconds / _kNumIters}';
      //time ='${(finishDate - startdate)/_kNumIters}';
    });
  }

  pressBorweinButton(){
    //var startdate = DateTime.now().millisecondsSinceEpoch;
    final Stopwatch watch = Stopwatch();
    print('Pi calc tracker benchmark...');
    watch.start();
    runBorwein();
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
      borweinTime ='${watch.elapsedMicroseconds / _kNumIters}';
      //time ='${(finishDate - startdate)/_kNumIters}';
    });
  }


  runGaussLegendreTest(){
    PiCalculator  calc =  PiCalculator();
    for (int i = 0; i < _kNumIters; i += 1) {
      calc.gaussLegendre(_gaussLegendreIterats);
    }
  }

  runBorwein(){
    PiCalculator  calc =  PiCalculator();
    for (int i = 0; i < _kNumIters; i += 1) {
      calc.borwein(_borweinIterats);
    }
  }


}
