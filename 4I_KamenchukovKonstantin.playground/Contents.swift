import SwiftUI
import Foundation

enum WindowsState {
    case open, close
}
enum EngineState {
    case on, off
}
enum TrunkFill {
    case full, empty
}

class Vehicle {

    let model: String
    let year: UInt
    let trunkSize: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var trunkFill: TrunkFill
    
    func windows(_ newState: WindowsState) {
        self.windowsState = newState
    }
  
    
    func engine(_ newState: EngineState) {
    self.engineState = newState
    }
   
    func trunk(_ newState: TrunkFill) {
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
    init(model: String, year: UInt, trunkSize: Double) {
        self.model = model
        self.year = year
        self.trunkSize = trunkSize
        self.engineState = .off
        self.windowsState = .close
        self.trunkFill = .empty
    }
}

class SportCar: Vehicle {
    var activeDiff: Bool
    var spoilerAngle: Double
    
    func diffAvailability(_ value: Bool) {
        activeDiff = value
    }
    
    func angleAttack(_ angle: Double) {
        spoilerAngle = angle
    }
    
    init(model: String, year: UInt, trunkSize: Double, activeDiff: Bool, spoilerAngle: Double) {
        self.activeDiff = activeDiff
        self.spoilerAngle = spoilerAngle
        super.init(model: model, year: year, trunkSize: trunkSize)
    }
    override func printVehicleInfo() {
        print("---------------")
        print("model = \(model)")
        print("year = \(year) ")
        print("trunkSize = \(trunkSize) liters")
        print("engineState = \(engineState)")
        print("spoiler angle = \(spoilerAngle) degree")
        print("active differencial = \(activeDiff)")
        print("---------------")
    }
}

class TruckCar: Vehicle {
    var wheelCount: UInt
    var torque: Double
    
    func wheels(_ value: UInt) {
        wheelCount = value
    }
    
    func torqueNm(_ nm: Double) {
        torque = nm
    }
    
    init(model: String, year: UInt, trunkSize: Double, wheelCount: UInt, torque: Double) {
        self.wheelCount = wheelCount
        self.torque = torque
        super.init(model: model, year: year, trunkSize: trunkSize)
    }
    override func printVehicleInfo() {
        print("---------------")
        print("model = \(model)")
        print("year = \(year) ")
        print("trunkSize = \(trunkSize) liters")
        print("engineState = \(engineState)")
        print("number of wheels  = \(wheelCount)")
        print("torque = \(torque) Nm")
        print("---------------")
    }
}





var sportCar1 = SportCar(model: "Bugatti", year: 2019, trunkSize: 150, activeDiff: true, spoilerAngle: 25)
sportCar1.printVehicleInfo()

sportCar1.activeDiff = false
sportCar1.spoilerAngle = 5
sportCar1.printVehicleInfo()

var truckCar1 = TruckCar(model: "Man", year: 2008, trunkSize: 30000, wheelCount: 6, torque: 1500)
truckCar1.printVehicleInfo()

truckCar1.wheels(10)
truckCar1.torqueNm(2000)
truckCar1.printVehicleInfo()
