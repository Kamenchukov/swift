import Foundation
import SwiftUI

//task 1
var a: Int = 5
func even() {
    if (a % 2) == 0 {
        print("Its even number")
    } else {
        print("Its odd number")
    }
}
even()


//task 2
var b: Int = 11

func withoutRemainder() {
    if (b % 3) == 0 {
        print("Number divide without the remaider")
    } else {
        print("Number divide with the remaider")
    }
}
withoutRemainder()

//task 3

var array = [Int]()
for i: Int in 1...100 {
    array.append(i)
}
print(array)

//task 4

var evenAndThreeDelete = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print(evenAndThreeDelete)

//task 5

func fibonachiArray(_ n: Int) -> [Int]  {
    var fibonachi: [Int] = [1, 1]
    (2...n).forEach{
        i in
        fibonachi.append(fibonachi[i - 1] + fibonachi[i - 2])
    }
    return fibonachi
}
print(fibonachiArray(50))
//task 6

func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))
