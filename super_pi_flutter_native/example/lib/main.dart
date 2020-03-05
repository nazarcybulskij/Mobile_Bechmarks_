import 'package:flutter/material.dart';
import 'dart:ffi';  // For FFI
import 'dart:io';   // For Platform.isX

final DynamicLibrary nativeAddLib =
Platform.isAndroid
    ? DynamicLibrary.open("libsuper_pi_flutter_native.so")
    : DynamicLibrary.process();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final int Function(int x, int y) nativeAdd =
  nativeAddLib
      .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
      .asFunction();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('1 + 2 == ${nativeAdd(1, 2)}'),
        ),
      ),
    );
  }
}
