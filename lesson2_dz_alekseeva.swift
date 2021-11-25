//
//  main.swift
//  Lesson_2_AlekseevaEA
//
//  Created by Екатерина Алексеева on 23.11.2021.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
func evenNumber (_ chekingNumber: Int) {
    chekingNumber % 2 == 0 ? print ("Число четное") : print ("Число нечетное")
}

evenNumber(9)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func dividedOnThree (_ chekingNumber: Int) {
    chekingNumber % 3 == 0 ? print ("Число делится на 3") : print ("Число не делится на 3")
}

 dividedOnThree(12)

// 3. Создать возрастающий массив из 100 чисел.
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

 //Создаем возрастающий массив с шагом = 1
let sizeOfArray = 20
var array: [Int] = []
for count in (1...sizeOfArray) {
    array.append(count)
}
print(array)
print(array.count)

 //Создаем возрастающий массив с задаваемым шагом
//let sizeOfArray = 100
//let shagMassiva = 7
//var array: [Int] = []
//for count in stride(from: 0, to: sizeOfArray*shagMassiva, by: shagMassiva){
//    //print(count)
//    array.append(count)
//}
//print(array)
//print(array.count)

//Убираем из массива элемент, если он делится на 2 и не делится на 3
for elementMassiva in array {
    if (elementMassiva % 2 == 0 || elementMassiva % 3 != 0) {
        if let count = array.firstIndex(of: elementMassiva) {
            array.remove(at: count)
        }
    }
}
print(array)


//5.  Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
var arrayFibonacci: [Int] = [1, 1]
let sizeOfArray = 9

//Функция, добавляющая в конец массива следующее число Фибоначчи
func newFibonacci (_ array: [Int]) -> [Int] {
    let count = array.count
    var newArray = array
    newArray.append(newArray[count - 2] + newArray[count - 1])
    return newArray;
}

for _ in (2...sizeOfArray-1) {
    arrayFibonacci = newFibonacci(arrayFibonacci)
}

print(arrayFibonacci)

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
let sizeOfArray = 40
var array: [Int] = []
for count in (2...sizeOfArray + 1){
    array.append(count)
}
print (array)

func zamenaKratnychElemntov (_ checkNumber: Int, _ array: [Int]) -> [Int] {
    var array1 = array
    for i in (0...array.count-1) {
        if array1[i] % checkNumber == 0 {
            array1[i] = checkNumber
        }
        else {
        }
    }
    
    return array1
}

var arrayItog: [Int] = []
arrayItog.append(array[0])

for i in (1...sizeOfArray - 1){
    array.removeFirst()
    array = zamenaKratnychElemntov(arrayItog[i-1], array)
    arrayItog.append(array[0])
}

print(arrayItog)
arrayItog = Array(Set(arrayItog)).sorted()
print(arrayItog)



