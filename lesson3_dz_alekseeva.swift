//
//  main.swift
//  Lesson_3_AlekseevaEA
//
//  Created by Екатерина Алексеева on 29.11.2021.
//

import Foundation

enum EngineStatus {
     case on
     case off
 }

 enum WindowsStatus {
     case opened
     case closed
 }

enum CarModel: String {
    case jaguar
    case porsche
    case lamborghini
    case ferrari
    case mcLaren
    
    var model: String {
        switch self {
        case .jaguar:
            return "Ягуар"
        case .porsche:
            return "Порше"
        case .lamborghini:
            return "Ламборджини"
        case .ferrari:
            return "Феррари"
        case .mcLaren:
            return "МакЛарен"
        }
    }
}

enum CarColor {
    case yellow
    case red
    case blue
    case green
    
    var color: String {
        switch self {
        case .yellow:
            return "желтого цвета"
        case .red:
            return "красного цвета"
        case .blue:
            return "синего цвета"
        case .green:
            return "зеленого цвета"
        }
    }
}

struct SportCar {
    let carModel: CarModel
    let carYearOfManufacture: Int
    let carColor: CarColor
    let enginePower: Int
    let maxSpeed: Int
    let trunkVolume: Int
    var baggageVolume: Int = 0
    var freeVolume: Int = 0
    var engine: EngineStatus = .off
    var windows:  WindowsStatus = .closed
    
    init (carModel: CarModel,
          carYearOfManufacture: Int = 0,
          carColor: CarColor,
          enginePower: Int = 0,
          maxSpeed: Int = 0,
          trunkVolume: Int = 0,
          baggageVolume: Int = 0,
          freeVolume: Int = 0,
          engine: EngineStatus = .off,
          windows:  WindowsStatus = .closed) {
        
        switch carModel {
        case .jaguar:
            self.carModel = .jaguar
            self.carYearOfManufacture = 1961
            self.enginePower = 265
            self.maxSpeed = 240
            self.trunkVolume = 50
        case .porsche:
            self.carModel = .porsche
            self.carYearOfManufacture = 1964
            self.enginePower = 500
            self.maxSpeed = 323
            self.trunkVolume = 130
        case .lamborghini:
            self.carModel = .lamborghini
            self.carYearOfManufacture = 1966
            self.enginePower = 350
            self.maxSpeed = 280
            self.trunkVolume = 30
        case .ferrari:
            self.carModel = .ferrari
            self.carYearOfManufacture = 1981
            self.enginePower = 478
            self.maxSpeed = 324
            self.trunkVolume = 80
        case .mcLaren:
            self.carModel = .mcLaren
            self.carYearOfManufacture = 1993
            self.enginePower = 627
            self.maxSpeed = 386
            self.trunkVolume = 220
        }
        
        self.carColor = carColor
        self.baggageVolume = 0
        self.freeVolume = self.trunkVolume
        self.engine = EngineStatus.off
        self.windows = WindowsStatus.closed
        print("Великолепный выбор! Ваш автомобиль \(self.carModel.model) \(self.carYearOfManufacture) года выпуска \(self.carColor.color)")
        print("Его мощность составляет: \(self.enginePower) л.с. \nЕго максимальная скороксть: \(self.maxSpeed) км/ч")
        
    }
    
    mutating func startOrTurnOffEngine(to engineStatus: EngineStatus) {
        if engineStatus == .on && engine == .off {
            engine = EngineStatus.on
            print("Двигатель заведен, поехали!")
        }
        else if engineStatus == .on && engine == .on {
            print("Двигатель уже заведен, можем продолжать движение")
        }
        else if engineStatus == .off && engine == .off {
            print("Двигатель уже выключен")
        }
        else {
            engine = .off
            print("Приехали, двигатель выключен")
        }
    }
    
    mutating func openOrCloseWindow(to windowStatus: WindowsStatus) {
        if windowStatus == .opened && windows == .closed {
            windows = WindowsStatus.opened
            print("Окна открыты, сейчас подует ветерок!")
        }
        else if windowStatus == .opened && windows == .opened {
            print("Окна уже открыты, откроем чуть больше")
        }
        else if windowStatus == .closed && windows == .closed {
            print("Окна уже закрыты")
        }
        else {
            windows = .closed
            print("Закрываем окна")
        }
    }
    
    mutating func putBaggageInTrunk(putVolume: Int) {
        if freeVolume == 0 {
            print("Багажник уже заполнен, свобоного места нет")
        }
        else if freeVolume < putVolume {
            print("Места в багажнике не хвтатает")
        }
        else {
            baggageVolume += putVolume
            freeVolume -= putVolume
            print("В багажнике осталось \(freeVolume) литров свобоного места, исопльзовано \(baggageVolume) литров")
        }
    }
    
    func checkStatus() {
        if engine == EngineStatus.off {
            print("Машина не заведена")
        }
        else {
            print("Машина заведена")
        }
        if windows == WindowsStatus.closed{
            print("Окна закрыты")
        }
        else {
            print("Окна открыты")
        }
    }
    
    func checkFreeVolume() {
        print("В багажнике \(freeVolume) литров свобоного места, занято \(baggageVolume) литров багажа")
    }

}

var yourCar = SportCar(carModel: .porsche, carColor: .green)
yourCar.startOrTurnOffEngine(to: .on)
yourCar.startOrTurnOffEngine(to: .on)
yourCar.checkStatus()
yourCar.openOrCloseWindow(to: .opened)
yourCar.openOrCloseWindow(to: .opened)
yourCar.openOrCloseWindow(to: .closed)
yourCar.checkStatus()
yourCar.checkFreeVolume()
yourCar.putBaggageInTrunk(putVolume: 100)
yourCar.putBaggageInTrunk(putVolume: 50)
yourCar.putBaggageInTrunk(putVolume: 20)
yourCar.checkFreeVolume()
