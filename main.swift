//
//  main.swift
//  Skutarenko_Lesson_16
//
//  Created by Екатерина Алексеева on 20.12.2021.
//

import Foundation

/*
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 
 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
 
 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 
 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
 
 5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)
 */


enum Figure: String {
    
    case blackSq   = " \u{25A0} "
    case whiteSq   = " \u{25A2} "
    case snowflake = " \u{2744} "
    case snowman   = " \u{26C4}"
}

enum Direction: String {
    
    case right = "\u{25B6}"
    case left  = "\u{25C0}"
    case up    = "\u{25B2}"
    case down  = "\u{25BC}"
}


struct Room {
    
    let width:  Int      //ширина
    let height: Int     //высота
    
    var persone: Persone {
        
        didSet {
            if persone.x <= 0 || persone.y <= 0 || persone.x >= width - 1 || persone.y >= height - 1 {
                print("This move is impossible, try again")
                persone = oldValue
            }
        }
    }
    
    var box: Persone {
        
        didSet {
            if box.x <= 0 || box.y <= 0 || box.x >= width - 1 || box.y >= height - 1 {
                print("This move is impossible, try again")
                box = oldValue
            }
        }
    }
    
    func printRoom() {
        
        let roomDictionary = getRoomDict()
        var roomDictKey = ""
        
        for i in 0 ..< height {
            
            for j in 0 ..< width {
                roomDictKey = String(i) + String(j)
                print(roomDictionary[roomDictKey]!,  terminator:"")
            }
            print("")
        }
        print("")
    }
    
    
    func getRoomDict() -> [String: String] {
        
        var roomDict = ["": ""]
        var roomDictKey: String
        
        for i in 0 ..< height {
            
            for j in 0 ..< width {
                roomDictKey = String(i) + String(j)
                
                if i == 0 || i == height - 1 || j == 0 || j == width - 1 {
                    roomDict[roomDictKey] = Figure.blackSq.rawValue
                    
                } else if j == persone.x, i == persone.y {
                    roomDict[roomDictKey] = Figure.snowman.rawValue
                    
                } else if j == box.x, i == box.y {
                    roomDict[roomDictKey] = Figure.snowflake.rawValue
                    
                } else {
                    roomDict[roomDictKey] = Figure.whiteSq.rawValue
                }
            }
        }
        return roomDict
    }
    
    mutating func movePersone(dir: Direction) {
        
        print("Снеговик: \(persone.x), \(persone.y) Cнежинка: \(box.x), \( box.y)")
        print("You want to move like this: \(dir.rawValue)")
        
        if  abs(persone.x - box.x) == 1 && persone.y == box.y ||
                abs(persone.y - box.y) == 1 && persone.x == box.x {
            
            persone.movePersone(dir: dir)
            
            if persone.x == box.x, persone.y == box.y {
                
                box.movePersone(dir: dir)
                
                if persone.x == box.x, persone.y == box.y {
                    
                    persone.removePersone(dir: dir)
                    
                }
            }
            
        } else {
            
            persone.movePersone(dir: dir)
            
        }
        
        printRoom()
        print("")
    }
    
}

struct Persone {
    
    var x: Int
    var y: Int
    
    mutating func movePersone(dir: Direction) {
        
        switch dir {
            
        case .right:
            self.x += 1
        case .left:
            self.x -= 1
        case .up:
            self.y -= 1
        case .down:
            self.y += 1
        }
    }
    
    mutating func removePersone (dir: Direction) {
        
        switch dir {
            
        case .right:
            self.x -= 1
        case .left:
            self.x += 1
        case .up:
            self.y += 1
        case .down:
            self.y -= 1
        }
    }
}

var room = Room(width: 6, height: 6, persone: Persone(x: 4, y: 3), box: Persone(x: 2, y: 2))

room.printRoom()
room.movePersone(dir: .up)
room.movePersone(dir: .up)
room.movePersone(dir: .left)
room.movePersone(dir: .left)
room.movePersone(dir: .left)
room.movePersone(dir: .down)
room.movePersone(dir: .right)
room.movePersone(dir: .right)
