import UIKit

protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct someStruct: HomeworkService {
    func fibonacci(n: Int) -> [Int] {
        var sequence = [0, 1]
        if n <= 1 {
            return sequence
        }
        for _ in 0...n - 2 {
            let first = sequence[sequence.count - 2]
            let second = sequence.last!
            sequence.append(first + second)
        }
        return sequence
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        
        var mutableArray = rawArray
        let arrayLength = mutableArray.count
        
        guard arrayLength > 1 else {
            return mutableArray
        }
        
        for lastIndex in (1..<arrayLength).reversed() {
            for index in 0..<lastIndex {
                if mutableArray[index] > mutableArray[index + 1] {
                    mutableArray.swapAt(index, index + 1)
                }
            }
        }
        return mutableArray
    }
    func firstLetter(strings: [String]) -> [Character] {
        var arrayOfCharacters: [Character] = []
        
        for value in strings {
            arrayOfCharacters.append(value.first ?? "-")
        }
        return arrayOfCharacters
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var resultArray: [Int] = []
        
        for index in 0..<array.count {
            if condition(array[index]) {
                resultArray.append(array[index])
            }
        }
        return resultArray
    }
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
}

var test = someStruct()

print(test.sort(rawArray: [11,17,31,11,1,5,3,12]))
print(test.fibonacci(n: 6))
print(test.divideWithRemainder(10, by: 3))
print(test.firstLetter(strings: ["123", "222","345"]))



