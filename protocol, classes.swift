//
//  Structs.swift
//  Lesson_6_AlekseevaEA
//
//  Created by Екатерина Алексеева on 10.12.2021.
//

import Foundation

//MARK: - FigureProtocol

protocol FigureProtocol: CustomStringConvertible {
    var figureName: String { get }
    var square: Double { get }
    
    func moreThenMeaning (figure: FigureProtocol, meaning: Double) -> Bool
    func lessThenMeaning (figure: FigureProtocol, meaning: Double) -> Bool
}

extension FigureProtocol {
    func moreThenMeaning (figure: FigureProtocol, meaning: Double) -> Bool {
        return figure.square > meaning
    }
    
    func lessThenMeaning (figure: FigureProtocol, meaning: Double) -> Bool {
        return figure.square < meaning
    }
    
    var description: String {
        return String("\(figureName) площадью \(square)")
    }
}

//MARK: - class Circle

class Circle: FigureProtocol {
    
    let figureName: String
    var square: Double = 0
    
    let radius: Int
   
    init(radius: Int) {
        self.figureName = "Круг"
        self.radius = radius
        self.square = 3.14 * Double(radius)
    }

}

//MARK: - class RightTriangle

class RightTriangle: FigureProtocol {
    
    let figureName: String
    var square: Double = 0
    
    let firstСathetus: Int
    let secondСathetus: Int
    
    init(firstСathetus: Int, secondСathetus: Int) {
        self.figureName = "Треугольник"
        self.firstСathetus = firstСathetus
        self.secondСathetus = secondСathetus
        self.square = 0.5 * Double(firstСathetus * secondСathetus)
    }
}

//MARK: - class Rectangle
class Rectangle: FigureProtocol {
    
    let figureName: String
    var square: Double = 0
    
    let firstSide: Int
    let secondSide: Int
    
    init(firstSide: Int, secondSide: Int) {
        self.figureName = "Прямоугольник"
        self.firstSide = firstSide
        self.secondSide = secondSide
        self.square = Double(firstSide * secondSide)
    }
}
