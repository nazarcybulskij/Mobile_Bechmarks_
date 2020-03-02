package com.example.superpi_android

internal class PiCalculator {
    fun gaussLegendre(iterations: Long): Double {
        var a = 1.0
        var b = 1.0f / Math.sqrt(2.0)
        var t = 1.0f / 4.0f.toDouble()
        var p = 1.0
        for (i in 0 until iterations) {
            val aNext = (a + b) / 2
            val bNext = Math.sqrt(a * b)
            val tNext = t - p * Math.pow(a - aNext, 2.0)
            val pNext = 2 * p
            a = aNext
            b = bNext
            t = tNext
            p = pNext
        }
        return Math.pow(a + b, 2.0) / (4 * t)
    }

    fun getOneByPi(k: Long): Double {
        var ak: Double = 6.0 - 4 * Math.sqrt(2.0)
        var yk: Double = Math.sqrt(2.0) - 1.0
        var ak1: Double
        var yk1: Double
        for (i in 0 until k) {
            yk1 = (1 - Math.pow(1 - yk * yk * yk * yk, 0.25)) / (1 + Math.pow(1 - yk * yk * yk * yk, 0.25))
            ak1 = ak * Math.pow(1 + yk1, 4.0) - Math.pow(2.0, 2.0 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1)
            yk = yk1
            ak = ak1
        }
        return ak
    }
}