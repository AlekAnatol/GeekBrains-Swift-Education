//
//  main.swift
//  Lesson_1_AlekseevaEA
//
//  Created by Екатерина Алексеева on 20.11.2021.
//

import Foundation

// Задание 1 - Решите квадратное уравнение

//Квадратное уравнение имеет вид: a*x^2 + b*x + c = 0
//Введите коэффициенты ниже

let a:Double = 1
let b:Double = -3
let c:Double = 2

if (a==0)
{
    if (b==0)
    {
        print("Уравнение не задано")
    }
    else
    {
        let x1:Double = -c/b
        print("Уравнение не квадратное, корень уравнения:")
        print(x1)
    }
}

else
{
    let discriminant:Double = pow(b,2) - 4*a*c
    //print (discriminant)
    if (discriminant < 0)
    {
        print("Уравнение квадратное, корней не имеет")
    }
    else if (discriminant == 0)
    {
        let x1:Double = -b/(2*a)
        print("Уравнение квадратное, имеет один корень:")
        print(x1)
    }
    else
    {
        let x1:Double = (-b+sqrt(discriminant))/(2*a)
        let x2:Double = (-b-sqrt(discriminant))/(2*a)
        print("Уравнение квадратное, имеет два корня:")
        print(x1)
        print(x2)
    }
}


// Задание 2 - Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let katetOne:Double = 3
let katetTwo:Double = 4
let gipotenuza:Double = sqrt(pow(katetOne,2)+pow (katetTwo,2))
let perimetr:Double = katetOne + katetTwo + gipotenuza
let ploshad:Double = katetOne * katetTwo / 2

print ("Гипотенуза равна: " + String(gipotenuza))
print ("Периметр равен: " + String(perimetr))
print ("Площадь равна: " + String(ploshad))


// Задание 3 - Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var summaVklada:Double = 1000
let procentVklada:Double = 20
let vremyaVklada:Int = 5
var i:Int = 0

while (i < vremyaVklada)
{
    summaVklada = summaVklada * (1 + procentVklada/100)
    i = i + 1
}
print ("Сумма вклада в конце периода: " + String(summaVklada))
