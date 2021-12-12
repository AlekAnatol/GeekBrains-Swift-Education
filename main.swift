//
//  main.swift
//  Lesson_7_AlekseevaEA
//
//  Created by Екатерина Алексеева on 12.12.2021.
//

import Foundation

//MARK: - Enums and Structures
enum RentalMachineError: Error {
    
    case invalidSelection
    case outOfStock
    case insufficientFunds
}

struct Bike {
    
    let typeOfBike: String
}

struct Item {
    
    let typeOfBike: String
    var count: Int
    let price: Int
}

//MARK: - Class RentalMachine
class RentalMachine {
    
    var inventory = ["ChildsBike": Item(typeOfBike: "ChildsBike", count: 4, price: 50),
                     "AdultsBike": Item(typeOfBike: "AdultsBike", count: 10, price: 100),
                     "TandemBike": Item(typeOfBike: "TandemBike", count: 0, price: 120)]
    
    var depositeCoins: Int = 0
    
    //MARK: - Public Methods
    func rentBike(_ typeOfBike: String) throws -> Bike {
        
        guard let typeBike = inventory[typeOfBike] else {
            throw RentalMachineError.invalidSelection
        }
        
        guard typeBike.count > 0 else {
            throw RentalMachineError.outOfStock
        }
        
        guard typeBike.price < depositeCoins else {
            throw RentalMachineError.insufficientFunds
        }
        
        depositeCoins -= typeBike.price
        inventory[typeOfBike]?.count -= 1
        print("Вам выдан в аренду велоиспед типа \(typeOfBike)")
        let newBike = Bike(typeOfBike: typeOfBike)
        return newBike
    }
    
    func printError(error: Error) {
        
        switch error {
            
        case RentalMachineError.invalidSelection:
            print("Такого типа велосипедов не сдаем в аренду")
            
        case RentalMachineError.outOfStock:
            print("Все велосипеды данного типа уже сданы в аренду")
            
        case RentalMachineError.insufficientFunds:
            print("Недостаточно средств")
            
        default:
            print("Неопознанная ошибка")
        }
    }
}

let rentalMachine = RentalMachine()

rentalMachine.depositeCoins = 110

print("У вас на счету \(rentalMachine.depositeCoins) рублей")


do {
    _ = try rentalMachine.rentBike("TandemBike")
    
} catch let catchedError {
    rentalMachine.printError(error: catchedError)
}

print("У вас на счету \(rentalMachine.depositeCoins) рублей")


do {
    _ = try rentalMachine.rentBike("ChildsBike")
    
} catch let catchedError {
    rentalMachine.printError(error: catchedError)
}

print("У вас на счету \(rentalMachine.depositeCoins) рублей")


do {
    _ = try rentalMachine.rentBike("AdultsBike")
    
} catch let catchedError {
    rentalMachine.printError(error: catchedError)
}

print("У вас на счету \(rentalMachine.depositeCoins) рублей")

do {
    _ = try rentalMachine.rentBike("SomeBike")
    
} catch let catchedError {
    rentalMachine.printError(error: catchedError)
}

print("У вас на счету \(rentalMachine.depositeCoins) рублей")
