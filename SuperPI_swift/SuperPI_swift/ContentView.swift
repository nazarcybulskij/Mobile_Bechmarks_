//
//  ContentView.swift
//  SuperPI_swift
//
//  Created by NazarKo on 2/26/20.
//  Copyright © 2020 ua.inveritasoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time: String = "0.0";
    
    var body: some View {
        Button(action:{
            NSLog("Start");
            let startTime = getCurrentMillis();
            var i: Int = 0;
            while((i < numIters) == true) {
                i = i + 1;
                //gaussLegendre(iterations: 100000000)
                //getOneByPi(iterations:1000000)
                mathPow(iterations: 10000000)
            }
            let endTime = getCurrentMillis();
            NSLog("End");
            let iterTime = Double(endTime-startTime)/Double(numIters);
            NSLog("Total execution time: " + String(iterTime) + " ms");
            self.time = String(iterTime);
            NSLog(self.time);
            
        }){
            Text(time)
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getCurrentMillis()->Int64{
    return  Int64(NSDate().timeIntervalSince1970 * 1000)
}

let numIters = 100;

func gaussLegendre(iterations:Int) -> Double {
  var a:Double = 1.0;
  var b:Double = 1.0 / sqrt(2);
  var t:Double = 1.0 / 4.0;
  var p:Double = 1.0;

  var i: Int = 0;
  while((i < iterations) == true) {
    i = i + 1
    let aNext:Double = (a + b) / 2;
    let bNext:Double = sqrt(a * b);
    let tNext:Double = t - p * pow(a - aNext, 2);
    let pNext:Double = 2 * p;
    a = aNext;
    b = bNext;
    t = tNext;
    p = pNext;
  }
  return pow(a + b, 2)/(4 * t);
}

func getOneByPi(iterations:Int) -> Double {
  var ak:Double = 6.0 - 4 * sqrt(2);
  var yk:Double = sqrt(2) - 1.0;
  var ak1:Double ;
  var yk1:Double;
  var temp2 :double_t;
  var temp1 :double_t;
  var i: Double = 0;
  let iter = Double(iterations)
  while((i < iter) == true) {
     i = i + 1
     yk1 = (1 - pow((1 - yk * yk * yk * yk),(0.25)))/(1 + pow((1 - yk * yk * yk * yk),(0.25)));
     temp2 = powl(2.0, 2.0 * i + 3.0)
     temp1 = (1 + yk1 + yk1 * yk1) * temp2 * yk1
     ak1 = ak * pow((1 + yk1), 4) - temp1;
     yk = yk1;
     ak = ak1;
  }
  return ak;
}

func mathPow(iterations:Int){
    var i: Double = 0;
    let iter = Double(iterations)
    while((i < iter) == true) {
       i = i + 1
        pow(i, 2.0)
    }
}

