/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import * as Timing from './timing';
import {
  AppRegistry,
  StyleSheet,
  Button,
  TouchableOpacity,
  Text,
  StatusBar,
  SafeAreaView,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';

export default class App extends Component {
  state: {
    time: string,
  };

  constructor(props: Props) {
    super(props);
    this.state = {
      time: '',
    };
  }

  render() {
    return (
      <>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView style={styles.container}>
          <TouchableOpacity
            style={styles.startTestButton}
            onPress={() => {
              console.log('Start');
              let startTime = Timing.now();
              for (let i = 0; i < numIters; i += 1) {
                //gaussLegendre(100000000);
                getOneByPi(1000000);
              }
              let endTime = Timing.now();
              console.log('Finish');
              let iterTime = (endTime - startTime) / numIters;
              console.log(iterTime);
              this.setState({time: iterTime.toString()});
            }}
            underlayColor="#fff">
            <Text style={styles.startTestText}>{this.state.time}</Text>
          </TouchableOpacity>
        </SafeAreaView>
      </>
    );
  }
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  start: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  btnStyle: {
    justifyContent: 'center',
    alignSelf: 'stretch',
    textAlignVertical: 'center',
  },
  startTestButton: {
    marginRight: 40,
    marginLeft: 40,
    marginTop: 10,
    paddingTop: 10,
    paddingBottom: 10,
    backgroundColor: '#1E6738',
    borderRadius: 10,
    borderWidth: 1,
    borderColor: '#fff',
  },
  startTestText: {
    color: '#fff',
    textAlign: 'center',
    paddingLeft: 10,
    paddingRight: 10,
  },
});

//AppRegistry.registerComponent('App', () => App);

//Pi calc

const numIters = 100;

function gaussLegendre(iterations) {
  let a = 1.0;
  let b = 1.0 / Math.sqrt(2);
  let t = 1.0 / 4.0;
  let p = 1.0;
  for (let i = 0; i < iterations; i++) {
    let aNext = (a + b) / 2;
    let bNext = Math.sqrt(a * b);
    let tNext = t - p * Math.pow(a - aNext, 2);
    let pNext = 2 * p;
    a = aNext;
    b = bNext;
    t = tNext;
    p = pNext;
  }
  return Math.pow(a + b, 2) / (4 * t);
}

function getOneByPi(k) {
  let ak = 6.0 - 4 * Math.sqrt(2);
  let yk = Math.sqrt(2) - 1.0;
  var ak1;
  var yk1;
  for (let i = 0; i < k; i++) {
    yk1 =
      (1 - Math.pow(1 - yk * yk * yk * yk, 0.25)) /
      (1 + Math.pow(1 - yk * yk * yk * yk, 0.25));
    ak1 =
      ak * Math.pow(1 + yk1, 4) -
      Math.pow(2, 2 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1);
    yk = yk1;
    ak = ak1;
  }
  return ak;
}
