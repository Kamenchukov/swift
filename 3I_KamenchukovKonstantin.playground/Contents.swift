import SwiftUI
import Foundation

// task 1 & 2 & 3 & 4 & 5 & 6

enum WindowsState {
    case open, close
}
enum EngineState {
    case on, off
}
enum TrunkFill {
    case full, empty
}

struct Vehicle {

    let model: String
    let year: UInt
    let trunkSize: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var trunkFill: TrunkFill
    
    mutating func windows(_ newState: WindowsState) {
        self.windowsState = newState
    }
  
    
mutating func engine(_ newState: EngineState) {
    self.engineState = newState
    }
   
    mutating func trunk(_ newState: TrunkFill) {
        self.trunkFill = newState
    }
    
    func printVehicleInfo() {
        print("---------------")
        print("model = \(model)")
        print("year = \(year) ")
        print("trunkSize = \(trunkSize)")
        print("engineState = \(engineState)")
        print("windowsState = \(windowsState)")
        print("trunkFill = \(trunkFill)")
        print("---------------")
    }
    
}



var sportCar = Vehicle(model: "bmw", year: 2019, trunkSize: 500, engineState: .off, windowsState: .close, trunkFill: .empty)

var truck = Vehicle(model: "Man", year: 2007, trunkSize: 30000, engineState: .on, windowsState: .open, trunkFill: .full)


var anotherSportCar = Vehicle(model: "Audi", year: 2020, trunkSize: 600, engineState: .off, windowsState: .open, trunkFill: .empty)

var anotherTruck = Vehicle(model: "IVECO", year: 1998, trunkSize: 35000, engineState: .on, windowsState: .close, trunkFill: .empty)


truck.windows(.close)
truck.printVehicleInfo()
truck.trunk(.empty)
truck.printVehicleInfo()
truck.engine(.off)
truck.printVehicleInfo()

sportCar.engine(.on)
sportCar.printVehicleInfo()
sportCar.windows(.open)
sportCar.printVehicleInfo()

anotherSportCar.engine(.on)
anotherSportCar.printVehicleInfo()

anotherTruck.trunk(.full)
anotherTruck.windows(.open)
anotherTruck.printVehicleInfo()
