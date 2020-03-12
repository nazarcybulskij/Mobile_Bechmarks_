package com.example.superpi_android

import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    val numIters = 100

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<View>(R.id.btn_start_test).setOnClickListener {
            val startTime = System.currentTimeMillis()
            val calc = PiCalculator()
            var i = 0
            while (i < numIters) {
                //calc.getOneByPi(1000000)
                calc.mathPow(10000000)
                i += 1
            }
            val endTime = System.currentTimeMillis()
            val iterTime = (endTime - startTime) / numIters
            (findViewById<View>(R.id.btn_start_test) as Button).text = iterTime.toString()
            println("Total execution time: " + (endTime - startTime) / numIters + " ms")
        }
    }
}