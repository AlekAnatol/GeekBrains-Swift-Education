//
//  main.swift
//  Lesson_4_AlekseevaEA
//
//  Created by Екатерина Алексеева on 01.12.2021.
//

import Foundation

//MARK: - enums for class Car
enum Color:String {
    case red
    case green
    case blue
    case black
    case white
    
    var color: String {
        switch self {
        case .red:
            return("красного цвета")
        case .green:
            return("зеленого цвета")
        case .blue:
            return("синего цвета")
        case .black:
            return("черного цвета")
        case .white:
            return("белого цвета")
        }
    }
}

enum WindowsStatus {
    case opened
    case closed
}

enum EngineStatus {
    case on
    case off
}

//MARK: - class Car

class Car {
    private let carModel: String
    private let carYearOfCreating: Int
    private var carColor: Color
    var windowsStatus: WindowsStatus
    private var engineStatus: EngineStatus
    
    init(carModel: String,
         carYearOfCreating: Int,
         carColor: Color) {
        
        self.carModel = carModel
        self.carYearOfCreating = carYearOfCreating
        self.carColor = carColor
        self.windowsStatus = .closed
        self.engineStatus = .off
        
        print("Вы выбарли \(carModel) \(carYearOfCreating) года выпуска \(carColor.color) ")
    }
    
    func onOrTurnOffEngine(to status: EngineStatus) {
        
        if status == EngineStatus.on && engineStatus == .off {
            engineStatus = .on
            print("Мотор заведен, поехали!")
        }
        
        else if status == EngineStatus.on && engineStatus == .on {
            print("Машина уже заведена, осталось определиться с местом прибытия")
        }
        
        else if status == EngineStatus.off && engineStatus == .on {
            engineStatus = .off
            print("Приехали! Мотор заглушен")
        }
        
        else {
            print("Машина еще не заведена")
        }
    }
    
    func checkEngineStatus() {
        engineStatus == .on ? print("Мотор заведен") : print("Мотор заглушен")
    }
    
    func changeCarColor (to color: Color) {
        if color == carColor {
            print("Машина уже \(carColor.color)")
        }
        else {
            carColor = color
            print("Машина перекрашена, теперь она \(carColor.color)")
        }
    }
    
    func checkWindowsStatus() {
        windowsStatus == .opened ? print("Окна открыты") : print("Окна закрыты")
    }
    
    func openOrCloseWindow(to status: WindowsStatus){
        if status == WindowsStatus.opened && windowsStatus == .closed {
            windowsStatus = .opened
            print("Окна открыты")
        }
        
        else if status == WindowsStatus.opened && windowsStatus == .opened {
            print("Окна уже открыты. Осторожно, может продуть")
        }
        
        else if status == WindowsStatus.closed && windowsStatus == .opened {
            engineStatus = .off
            print("Окна закрыты")
        }
        
        else {
            print("Окна уже были закрыты")
        }
    }
    
}


//MARK: - enum for class SportCar
enum DrivingMode: String{
    case normal
    case eco
    case sport
    
    var mode: String{
        switch self {
        case .normal:
            return ("стандартный режим управления")
        case .eco:
            return("экологичный режим управления")
        case .sport:
            return("спортивный режим управления")
        }
    }
}

//MARK: - class SportCar
final class SportCar: Car{
    
    private var drivingMode: DrivingMode
    
    override init(
        carModel: String,
        carYearOfCreating: Int,
        carColor: Color) {
            
            self.drivingMode = .normal
            super.init(carModel: carModel, carYearOfCreating: carYearOfCreating, carColor: carColor)
            
            print("Режим управления: включен \(drivingMode.mode)")
        }
    
    override func openOrCloseWindow(to status: WindowsStatus) {
        
        if drivingMode == DrivingMode.sport {
            if status == .opened, windowsStatus == .closed {
                print("В данном режиме управления не рекомендуется открывать окна")
            }
            else if status == .opened, windowsStatus == .opened {
                print("В данном режиме управления опасно ездитьс открытыми окнами, они будут автоматически закрыты")
                windowsStatus = .closed
            }
        }
        
        if drivingMode == DrivingMode.eco || drivingMode == DrivingMode.normal {
            if status == .opened, windowsStatus == .closed {
                print("Окна открыты, можно насладиться видами")
                windowsStatus = .opened
            }
            else if status == .opened, windowsStatus == .opened {
                print("Окна уже открыты")
            }
        }
    
    }
    
    func changeDrivingMode(to mode: DrivingMode){
        if mode == .normal && drivingMode == .normal {
            print("Уже включен нормальный режим, выберите другой режим вождения или продоложайте движение")
        }
        
        else if mode == .normal && drivingMode != .normal {
            print("Включен нормальный режим управления")
            drivingMode = .normal
        }
        
        else if mode == .eco && drivingMode == .eco {
            print("Уже включен экологичный режим, выберите другой режим вождения или продоложайте движение")
        }
        
        else if mode == .eco && drivingMode != .eco {
            print("Включен экологичный режим управления")
            drivingMode = .eco
        }
        
        else if mode == .sport && drivingMode == .sport {
            print("Уже включен спортивный режим, выберите другой режим вождения или продоложайте движение")
        }
        
        else if mode == .sport && drivingMode != .sport {
            print("Включен спортивный режим управления")
            if windowsStatus == .opened {
                drivingMode = .sport
                windowsStatus = .closed
                print("В целях безопасности окна закрыты")
            }
            else {
                drivingMode = .sport
            }
        }
    }
}


//MARK: - enum for class TruckCar
enum TrailerAttached {
    case attached
    case unattached
}


//MARK: - class TruckCar
final class TruckCar: Car {
    private var isTrailerAttached: TrailerAttached
    private let trailerVolume: Int
    private var cargoVolumeInTrailer: Int
    private var freeVolume: Int
    
    init(
        carModel: String,
        carYearOfCreating: Int,
        carColor: Color,
        trailerVolume: Int) {
            self.isTrailerAttached = .attached
            self.trailerVolume = trailerVolume
            self.cargoVolumeInTrailer = 0
            self.freeVolume = trailerVolume
            
            super.init(carModel: carModel, carYearOfCreating: carYearOfCreating, carColor: carColor)
            print("У вашего автомобиля есть прицеп объемом \(trailerVolume) литров")
        }
    
    func checkFreeVolume() {
        isTrailerAttached == .attached ? print("В прицепе осталось \(freeVolume) литров") : print("Прицепа нет")
    }
    
    func changeTrailerStatus(to status: TrailerAttached) {
        if status == .attached, isTrailerAttached == .attached {
            print("Прицеп уже есть, второй присодединить невозможно")
        }
        
        else if status == .attached, isTrailerAttached == .unattached {
            isTrailerAttached = .attached
            print("Прицеп присоединен, его объем \(trailerVolume) литров")
            print("Свободного мест \(freeVolume) литров")
        }
        
        else if status == .unattached, isTrailerAttached == .attached {
            isTrailerAttached = .unattached
            print("Прицеп отсоединен")
        }
        
        else {
            print("Прицепа уже нет")
        }
    }
    
    func loadCargo(volumeOfCargo: Int) {
        if isTrailerAttached == .unattached{
            print("Прицепа нет, зугрузка невозможна")
        }
        
        else {
            if volumeOfCargo > freeVolume {
                print("Нет столько свободного места")
            }
            
            else {
                cargoVolumeInTrailer += volumeOfCargo
                freeVolume -= volumeOfCargo
                print("Успешно загружено \(volumeOfCargo) литров груза. \nОсталось \(freeVolume) литров свободного места")
            }
        }
    }
    
    func unloadCargo(volumeOfCargo: Int) {
        if isTrailerAttached == .unattached{
            print("Прицепа нет, выгрузка невозможна")
        }
        
        else {
            if volumeOfCargo > cargoVolumeInTrailer {
                print("Нет столько груза")
            }
            
            else {
                cargoVolumeInTrailer -= volumeOfCargo
                freeVolume += volumeOfCargo
                print("Успешно выгружено \(volumeOfCargo) литров груза. \nОсталось \(freeVolume) литров свободного места")
            }
        }
    }
}


var car = Car(carModel: "Опель", carYearOfCreating: 1988, carColor: .green)
car.checkEngineStatus()
car.onOrTurnOffEngine(to: .on)
car.checkEngineStatus()
car.changeCarColor(to: .green)
car.changeCarColor(to: .white)
car.checkWindowsStatus()
car.openOrCloseWindow(to: .closed)
car.openOrCloseWindow(to: .opened)
car.checkWindowsStatus()

let sportCar = SportCar(carModel: "Lambo", carYearOfCreating: 2020, carColor: .white)
sportCar.openOrCloseWindow(to: .opened)
sportCar.checkWindowsStatus()
sportCar.changeDrivingMode(to: .sport)
sportCar.changeDrivingMode(to: .eco)
sportCar.changeDrivingMode(to: .eco)
sportCar.changeCarColor(to: .red)



var truckCar = TruckCar(carModel: "Kamaz", carYearOfCreating: 2019, carColor: .green, trailerVolume: 15000)
truckCar.changeTrailerStatus(to: .unattached)
truckCar.changeTrailerStatus(to: .attached)
truckCar.checkFreeVolume()
truckCar.changeTrailerStatus(to: .unattached)
truckCar.loadCargo(volumeOfCargo: 14000)
truckCar.unloadCargo(volumeOfCargo: 15000)
truckCar.checkFreeVolume()
