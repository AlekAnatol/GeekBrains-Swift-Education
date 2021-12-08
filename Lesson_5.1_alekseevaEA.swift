//
//  main.swift
//  Lesson_5_AlekseevaEA
//
//  Created by Екатерина Алексеева on 07.12.2021.
//

import Foundation

//MARK: - enums for CarProtocol
enum Color: String {
    
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

//MARK: - enum for class TruckCar
enum TrailerAttached {
    case attached
    case unattached
}

//MARK: - protocol Car
protocol CarProtocol {
    
    var carModel: String { get set }
    var carYearOfCreating: Int { get set }
    var carColor: Color { get set }
    var windowsStatus: WindowsStatus { get set }
    var engineStatus: EngineStatus { get set }
    
    func checkEngineStatus()
    func checkWindowsStatus()
    mutating func changeCarColor (to color: Color)
    mutating func startStopEngine(to status: EngineStatus)
    mutating func openCloseWindow(to status: WindowsStatus)
}

//MARK: - extension for CarProtocol
extension CarProtocol {
    
    func checkEngineStatus() {
        engineStatus == .on ? print("Мотор заведен") : print("Мотор заглушен")
    }
    
    func checkWindowsStatus() {
        windowsStatus == .opened ? print("Окна открыты") : print("Окна закрыты")
    }
    
    mutating func changeCarColor (to color: Color) {
        
        if color == carColor {
            print("Машина уже \(carColor.color)")
            
        } else {
            carColor = color
            print("Машина перекрашена, теперь она \(carColor.color)")
        }
    }
    
    mutating func startStopEngine(to status: EngineStatus) {
        
        if status != engineStatus {
            
            status == .on ? print("Мотор заведен, поехали!") : print("Приехали! Мотор заглушен")
            engineStatus = status
            
        } else {
            
            status == .on ? print("Машина уже заведена, едем") : print("Машина еще не заведена")
        }
    }
    
    mutating func openCloseWindow(to status: WindowsStatus){
        
        if status != windowsStatus {
            
            status == .opened ?  print("Окна открыты") : print("Окна закрыты")
            windowsStatus = status
            
        } else {
            
            status == .closed ? print("Окна уже были закрыты") : print("Окна уже открыты. Осторожно, может продуть")
        }
    }
}

//MARK: - class SportCar
final class SportCar: CarProtocol {
    
     var carModel: String
     var carYearOfCreating: Int
     var carColor: Color
     var windowsStatus: WindowsStatus
     var engineStatus: EngineStatus
    
    private var drivingMode: DrivingMode
    
    init(carModel: String,
         carYearOfCreating: Int,
         carColor: Color) {
        
        self.carModel = carModel
        self.carYearOfCreating = carYearOfCreating
        self.carColor = carColor
        self.windowsStatus = .closed
        self.engineStatus = .off
        self.drivingMode = .normal
        
        print("Вы выбрали \(carModel) \(carYearOfCreating) года выпуска \(carColor.color) ")
        print("Режим управления: включен \(drivingMode.mode)")
    }
    
    
    func openCloseWindow(to status: WindowsStatus) {
        
        if drivingMode == DrivingMode.sport {
            
            status == .opened ? print("В данном режиме управления окна не открываются") : print("Окна уже закрыты")
            
        } else {
            
            if status != windowsStatus {
                
                status == .opened ? print("Окна открыты, можно насладиться видами") : print("Окна закрыты")
                windowsStatus = status
            
            } else {
                
                status == .opened ? print("Окна уже открыты") : print("Окна уже закрыты")
            }
        }
    }
    
    func changeDrivingMode(to mode: DrivingMode){
       
        if mode != drivingMode {
            
            drivingMode = mode
            switch mode {
            case .normal:
                print("Включен нормальный режим управления")
            case .eco:
                print("Включен экологичный режим управления")
            case .sport:
                print("Включен спортивный режим управления")
                if windowsStatus == .opened {
                    windowsStatus = .closed
                    print("В целях безопасности окна закрыты")
                }
            }
            
        } else {
            
            switch mode {
            case .normal:
                print("Уже включен нормальный режим, выберите другой режим вождения")
            case .eco:
                print("Уже включен экологичный режим, выберите другой режим вождения")
            case .sport:
                print("Уже включен спортивный режим, выберите другой режим вождения")
            }
        }
    }
}

//MARK: - extension for class SportCar
extension SportCar: CustomStringConvertible {
    var description: String {
            return String("Это спортивный автомобиль марки \(carModel) \n")
    }
}

//MARK: - class TruckCar
final class TruckCar: CarProtocol {
    
     var carModel: String
     var carYearOfCreating: Int
     var carColor: Color
     var windowsStatus: WindowsStatus
     var engineStatus: EngineStatus
    
    private var trailerAttached: TrailerAttached
    private let trailerVolume: Int
    private var cargoVolumeInTrailer: Int
    private var freeVolume: Int
    
    init(
        carModel: String,
        carYearOfCreating: Int,
        carColor: Color,
        trailerVolume: Int) {
            self.carModel = carModel
            self.carYearOfCreating = carYearOfCreating
            self.carColor = carColor
            self.windowsStatus = .closed
            self.engineStatus = .off
            
            self.trailerAttached = .attached
            self.trailerVolume = trailerVolume
            self.cargoVolumeInTrailer = 0
            self.freeVolume = trailerVolume
            
            print("Вы выбрали \(carModel) \(carYearOfCreating) года выпуска \(carColor.color) ")
            print("У вашего автомобиля есть прицеп объемом \(trailerVolume) литров")
        }
    
    func checkFreeVolume() {
        trailerAttached == .attached ? print("В прицепе осталось \(freeVolume) литров") : print("Прицепа нет")
    }
    
    func changeTrailerStatus(to status: TrailerAttached) {
        
        if status != trailerAttached {
            
            status == .unattached ? print("Прицеп отсоединен") : print("Прицеп присоединен, его объем \(trailerVolume) литров \nСвободного места \(freeVolume) литров")
            
            trailerAttached = status
            
        } else {
            
            status == .unattached ? print("Прицепа уже нет") : print("Прицеп уже есть, второй присодединить невозможно")
        }
    }
    
    func loadCargo(volumeOfCargo: Int) {
        
        if trailerAttached == .unattached{
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
        
        if trailerAttached == .unattached{
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

//MARK: - extension for class TruckCar
extension TruckCar: CustomStringConvertible {
    var description: String {
            return String("Это грузовой автомобиль марки \(carModel) \n")
    }
}

var sportCar = SportCar(carModel: "Lambo", carYearOfCreating: 2020, carColor: .white)
sportCar.openCloseWindow(to: .opened)
sportCar.openCloseWindow(to: .opened)
sportCar.openCloseWindow(to: .closed)
sportCar.openCloseWindow(to: .closed)
sportCar.openCloseWindow(to: .opened)
sportCar.checkWindowsStatus()
sportCar.changeDrivingMode(to: .sport)
sportCar.openCloseWindow(to: .opened)
sportCar.openCloseWindow(to: .closed)
sportCar.checkWindowsStatus()
sportCar.checkWindowsStatus()
sportCar.changeDrivingMode(to: .eco)
sportCar.changeDrivingMode(to: .eco)
sportCar.changeDrivingMode(to: .normal)
sportCar.changeDrivingMode(to: .normal)
sportCar.changeCarColor(to: .red)
sportCar.checkEngineStatus()
sportCar.startStopEngine(to: .on)
sportCar.startStopEngine(to: .on)
sportCar.checkEngineStatus()
print(sportCar)


var truckCar = TruckCar(carModel: "Kamaz", carYearOfCreating: 2019, carColor: .green, trailerVolume: 15000)
truckCar.changeTrailerStatus(to: .unattached)
truckCar.changeTrailerStatus(to: .attached)
truckCar.checkFreeVolume()
truckCar.changeTrailerStatus(to: .attached)
truckCar.loadCargo(volumeOfCargo: 14000)
truckCar.unloadCargo(volumeOfCargo: 15000)
truckCar.checkFreeVolume()
truckCar.openCloseWindow(to: .opened)
truckCar.openCloseWindow(to: .opened)
truckCar.openCloseWindow(to: .closed)
truckCar.openCloseWindow(to: .closed)
print(truckCar)
