//
//  MVVMViewMovel.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class MVVMViewModel: MVVMViewModelDelegate {
    
    var result: Double? {
        didSet{
            didChangeResultHandler?(self)
        }
    }
    
    var operations: [String]? {
        didSet{
            didChangeOperationsHandler?(self)
        }
    }
    
    var dataManager: DataManagerProtocol!
    var strings: Strings!
    var didChangeResultHandler: ((MVVMViewModelDelegate) -> ())?
    var didChangeOperationsHandler: ((MVVMViewModelDelegate) -> ())?
    
    required init(dataManager: DataManagerProtocol, strings: Strings) {
        self.dataManager = dataManager
        self.strings = strings
    }
    
    func didLoad() {
        operations = dataManager.obtainOperations()
    }
    /// обработка нажатия кнопки подсчета
    func didCalculatePressed(firstValue: String, secondValue: String, operation: String){
        if (firstValue != "" && secondValue != ""){
            if (firstValue.isDouble && secondValue.isDouble){
                result = calculate(firstvalue: Double(firstValue)!, secondValuse: Double(secondValue)!, operation: operation)
            } else {
                //если входные данные - не числа
                result = 0
            }
        } else {
            //если входные данные пустые
            result = 0
        }
    }
    
    /// метод, который определяет тип операции, введенной пользователем и выполняет соответствующую операцию
    ///
    /// - Parameters:
    ///   - firstvalue: первое число
    ///   - secondValuse: второе число
    ///   - operation: операция
    /// - Returns: число формата Double
    func calculate(firstvalue: Double, secondValuse: Double, operation: String) -> Double {
        switch operation {
        case "+":
            return sum(firstvalue: firstvalue, secondValuse: secondValuse)
        case "-":
            return substraction(firstvalue: firstvalue, secondValuse: secondValuse)
        case "*":
            return mulltiplacation(firstvalue: firstvalue, secondValuse: secondValuse)
        case "/":
            return devision(firstvalue: firstvalue, secondValuse: secondValuse)
        case "%":
            return percent(firstvalue: firstvalue, secondValuse: secondValuse)
        case "^":
            return power(firstvalue: firstvalue, secondValuse: secondValuse)
        default:
            return -1
        }
    }
    
    /// сумма двух чисел
    ///
    /// - Parameters:
    ///   - firstvalue: первое слагаемое
    ///   - secondValuse: второе слагаемое
    /// - Returns: сумма
    func  sum(firstvalue: Double, secondValuse: Double) -> Double {
        return firstvalue + secondValuse
    }
    
    /// Разность второго числа из первого
    ///
    /// - Parameters:
    ///   - firstvalue: уменьшаемое
    ///   - secondValuse: вычитаемое
    /// - Returns: разность
    func  substraction(firstvalue: Double, secondValuse: Double) -> Double {
        return firstvalue - secondValuse
    }
    
    /// Произведение двух чисел
    ///
    /// - Parameters:
    ///   - firstvalue: первый множитель
    ///   - secondValuse: второй множитель
    /// - Returns: произведение
    func  mulltiplacation(firstvalue: Double, secondValuse: Double) -> Double {
        return firstvalue * secondValuse
    }
    
    /// Деление первого числа на второе
    ///
    /// - Parameters:
    ///   - firstvalue: делимое
    ///   - secondValuse: делитель
    /// - Returns: частное
    func  devision(firstvalue: Double, secondValuse: Double) -> Double {
        return firstvalue / secondValuse
    }
    
    /// Нахождение процента (первое чиссло) из второго числа
    func  percent(firstvalue: Double, secondValuse: Double) -> Double {
        return firstvalue * secondValuse / 100
    }
    
    /// Нахождение степени
    ///
    /// - Parameters:
    ///   - firstvalue: начальное число
    ///   - secondValuse: значение степени
    /// - Returns: результат firstValue^secondValue
    func  power(firstvalue: Double, secondValuse: Double) -> Double {
        return pow(firstvalue, secondValuse)
    }
//    func showMessage(text: String?) {
//        <#code#>
//    }
//
//    func printMessage(text: String?) {
//        <#code#>
//    }
//
//    func showResult(firstValue: String, secondValue: String, operation: String, result: Double) {
//        <#code#>
//    }
//
//
//
}
