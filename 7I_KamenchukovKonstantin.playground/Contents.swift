import Cocoa

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}
 
class VendingMachine {
    var inventory = [
        "Sausage ": Item(price: 12, count: 7),
        "Apple": Item(price: 10, count: 4),
        "Pizza": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}




let favoriteSnacks = [
    "Meredith": "Apple",
    "Matt": "Pizza",
    "Chet": "Hot-dog"
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Pizza"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 23

do {
    try buyFavoriteSnack(person: "Meredith", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Ошибка выбора.")
} catch VendingMachineError.outOfStock {
    print("Нет в наличии.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Недостаточно средств. Пожалуйста вставьте еще \(coinsNeeded) монетки.")
} catch {
    print("Неожиданная ошибка: \(error).")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Некорректный вывод, нет в наличии или недостаточно денег.")
    }
}

do {
    try nourish(with: "Pineapple")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

