import Cocoa
import Foundation

enum windows{
    case open
    case closed
}
enum engine{
    case on
    case off
}
enum nitro{
    case nitroOn
    case nitroOff
}
enum luggage{
    case trunkIsFull
    case TrunkIsEmpty
}
protocol Car {
    var brand: String {get}
    var release: Int {get}
    var engineState: engine {get set}
    var windowsState: windows {get set}
}
extension Car {
    mutating func changeEngineState(engineState: engine){
        self.engineState = engineState
    }
    mutating func chageWindowsState(windowsState: windows){
        self.windowsState = windowsState
    }
}
class BasicCar: Car{
    var brand: String
    var release: Int
    var engineState: engine = .off
    var windowsState: windows = .closed

        
    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
    }
}
class SportCar: BasicCar, CustomStringConvertible{
    var nitroState: nitro = .nitroOff
    var description: String{
        return "Brand: \(brand), engine is \(engineState), windows is \(windowsState), nitro is \(nitroState), release date is \(release)"
    }
}
class TrunkCar: BasicCar, CustomStringConvertible{
    var trunkState: luggage = .TrunkIsEmpty
    var description: String{
        return "Brand: \(brand), engine is \(engineState), windows is \(windowsState), trunk is \(trunkState), release date is \(release)"
    }
}
var koeningsegg = SportCar(brand: "Koeningsegg", release: 2019)
var man = TrunkCar(brand: "Man", release: 2015)
print(koeningsegg.description)
print(man.description)

koeningsegg.changeEngineState(engineState: .on)
koeningsegg.nitroState = .nitroOn
koeningsegg.chageWindowsState(windowsState: .open)

man.chageWindowsState(windowsState: .open)
man.trunkState = .trunkIsFull


print(koeningsegg.description)
print(man.description)
