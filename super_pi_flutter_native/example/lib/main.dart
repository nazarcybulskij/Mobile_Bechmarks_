import 'package:flutter/material.dart';
import 'dart:ffi';  // For FFI
import 'dart:io';   // For Platform.isX
import 'common.dart';


const int _kNumIters = 100;

final DynamicLibrary nativeAddLib =
Platform.isAndroid
    ? DynamicLibrary.open("libsuper_pi_flutter_native.so")
    : DynamicLibrary.process();

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String time = '';

  final double Function(int) getOneByPi =  nativeAddLib
      .lookup<NativeFunction<Double Function(Int32)>>("getOneByPi")
      .asFunction();

  final double Function(int) gaussLegendre =  nativeAddLib
      .lookup<NativeFunction<Double Function(Int32)>>("gaussLegendre")
      .asFunction();


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
                for (int i = 0; i < _kNumIters; i += 1) {
                  gaussLegendre(100000000);
                  //getOneByPi(1000000);
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
