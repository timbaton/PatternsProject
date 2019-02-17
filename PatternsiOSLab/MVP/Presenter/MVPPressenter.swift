//
//  MVPPressenter.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class MVPPresenter: MVPViewOutput {
    
    weak var view: MVPViewInput!
    var dataManager: DataManagerProtocol!
    var strings: Strings!
    
    /// точка входа
    func  setupInitialize() {
        //передаем пикеру операции из dataManager
        view.initializePickerView(operations: dataManager.obtainOperations())
    }
    
    /// обработка нажатия кнопки подсчета
    func didCalculatePressed(firstValue: String, secondValue: String, operation: String){
        var result = 0.0
        if (firstValue != "" && secondValue != ""){
            if (firstValue.isDouble && secondValue.isDouble){
                result = calculate(firstvalue: Double(firstValue)!, secondValuse: Double(secondValue)!, operation: operation)
                //показываем результат
                view.showResult(firstValue: firstValue, secondValue: secondValue, operation: operation, result: result)
            } else {
                //если входные данные - не числа
                view.showMessage(text: strings.error_filed_not_number)
            }
        } else {
            //если входные данные пустые
            view.showMessage(text: strings.error_field_empty)
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
}
