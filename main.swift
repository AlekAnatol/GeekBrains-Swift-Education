//
//  main.swift
//  Lesson_6_AlekseevaEA
//
//  Created by Екатерина Алексеева on 08.12.2021.
//

import Foundation

struct Queue<T> {
    
    var arrayElements: [T]
    
    init(arrayElements: [T]) {
        self.arrayElements = arrayElements
    }
    
    mutating func addElement(i: T) {
        arrayElements.append(i)
    }
    
    mutating func getElement() -> T? {
        
        guard arrayElements.count > 0 else {
            print("В массиве больше нет элементов")
            return nil
        }
        
        print("Элемент очереди: \(arrayElements[0]) - обработан.")
        return arrayElements.removeFirst()
    }
    
    func myFilter<T>(queue: [T], predicate:(T) -> Bool) -> [T] {
        
      var result: [T] = []
        
      for i in queue {
        if predicate(i) {
          result.append(i)
        }
      }
      return result
    }
    
    subscript(index: Int) -> T? {
        
        return index <= arrayElements.count ? arrayElements[index - 1] : nil
    }
}


print("Работа с типом Int ===================")

var queueInt = Queue<Int>(arrayElements: [])

queueInt.addElement(i: 6)
queueInt.addElement(i: 8)
queueInt.addElement(i: 1)
queueInt.addElement(i: 12)
queueInt.addElement(i: 13)
queueInt.addElement(i: 5)

print(queueInt.arrayElements)

queueInt.getElement()
queueInt.getElement()

print(queueInt.arrayElements)
print(queueInt.myFilter(queue: queueInt.arrayElements, predicate: {$0 > 7}))
print(queueInt.myFilter(queue: queueInt.arrayElements, predicate: {$0 < 9}))
print(queueInt[1])
print(queueInt[4])
print(queueInt[5])

print("Работа с FigureProtocol ===================")

let circle1: FigureProtocol = Circle(radius: 4)
let circle2: FigureProtocol = Circle(radius: 7)
let circle3: FigureProtocol = Circle(radius: 11)
print(circle1)

let triangle1: FigureProtocol = RightTriangle(firstСathetus: 3, secondСathetus: 5)
let triangle2: FigureProtocol = RightTriangle(firstСathetus: 8, secondСathetus: 3)
print(triangle1)

let rectangle1: FigureProtocol = Rectangle(firstSide: 1, secondSide: 6)
print(rectangle1)

var queueFigure = Queue<FigureProtocol>(arrayElements: [circle1, triangle1, rectangle1, circle2])
queueFigure.addElement(i: triangle2)

print(queueFigure.arrayElements)

queueFigure.getElement()
queueFigure.getElement()

print(queueFigure.arrayElements)
print(circle1.lessThenMeaning(figure: circle1, meaning: 13))
print(queueFigure[2])
print(queueFigure[5])
