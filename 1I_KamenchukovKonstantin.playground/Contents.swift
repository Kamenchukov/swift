import UIKit
import Foundation

//квадратное уравнение
let a = 4.0
let b = 9.0
let c = 2.0
var x1:Double = 0
var x2:Double = 0

let D = (b*b)-(4*a*c)
print("Дискриминант квадратного уравнения: ", D)

if D<0 {
    print("Так как дискриминант меньше 0 - корней нет")
} else if D==0 {
    x1 = (-b/(2*a))
    x2 = x1
    print("Так как дискриминант равен 0, то у уровнения один корень")
    print(x1)
} else {
    x1 = (-Double(b)-sqrt(D)/(2*a))
    x2 = (-Double(b)+sqrt(D)/(2*a))
    print("Так как дескриминант больше 0, уравнение имеет два корня")
    print(x1)
    print(x2)
}

//Площадь, периметр и гипотенуза прямоугольного треугольника

let a1:Float = 4
let b1:Float = 7

let c1 = sqrt((a1*a1)+(b1*b1))
print("Гипотенуза прямоугольного треугольника равна")
print(c1)

let perimeter = a1 + b1 + c1
print(perimeter)

let square = (a1 * b1) / 2
print(square)

//Расчет депозита на 5 лет

var deposit = 1000.0
let percent = 10.0

var years = 5

let ye = percent / 100

for _ in 1...years {
 deposit = deposit * (1 + ye)
}
 print("Deposits = \(deposit) $")
    
    



