import Cocoa
import Foundation

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push (_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else {return nil}
        return elements.removeFirst()
    }
    mutating func array (_ predicate:(T) -> Bool) -> [T] {
        var tmp:[T] = []
        for element in elements{
            if predicate(element) {
                tmp.append(element)
            }
        }
        return tmp
    }
    mutating func someSort(_ predicate: (T, T) -> Bool) -> [T] {
        for i in 0..<elements.count {
            for g in 0..<(elements.count - 1) {
                if !predicate(elements[g],elements[i]) {
                    let tmp: T = elements[i];
                    elements[i] = elements[g];
                    elements[g] = tmp
                }
            }
        }
        return elements
    }
}
extension Queue {
    subscript(indexes: Int...) -> [T] {
        var result: [T] = []
        for index in indexes where index >= 0 && index < self.elements.count {
            result.append(self.elements[index])
        }
        return result
    }
}
protocol Vehicle {
    var brand: String {get set}
    var hp: Int {get set}
}


class SportCar: Vehicle {
    
    var brand: String
    var hp: Int
    
    init(brand: String, hp: Int) {
        self.brand = brand
        self.hp = hp
        
    }
}

var sportCar1 = Queue<SportCar>()

sportCar1.push(SportCar(brand: "Ferrari", hp: 560))
sportCar1.push(SportCar(brand: "BMW", hp: 340))
sportCar1.push(SportCar(brand: "Alfa Romeo", hp: 520))
sportCar1.push(SportCar(brand: "Pagani", hp: 780))
sportCar1.push(SportCar(brand: "BMW", hp: 550))

print("Sport cars rank")
print("\n")

print("filtred by  max hourse power")
let maxHp = sportCar1.someSort({ $0.hp > $1.hp})
print(maxHp.map({"\($0.brand) \($0.hp)"}))
print("\n")

print("filtred by  min hourse power")
let minHp = sportCar1.someSort({ $0.hp < $1.hp})
print(minHp.map({"\($0.brand) \($0.hp)"}))
print("\n")

print("filtred by brand BMW")
let bmwOnly = sportCar1.array({$0.brand == "BMW"})
print(bmwOnly.map({"\($0.brand) \($0.hp)"}))
