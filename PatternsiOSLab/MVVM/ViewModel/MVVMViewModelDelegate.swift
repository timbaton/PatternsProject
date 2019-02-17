//
//  MVVMViewModelDelegate.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol MVVMViewModelDelegate: AnyObject {
    /// переменная для наблюдения за изменением результатов
    var result: Double? { get set }
    
    /// переменная для наблюдения за изменением методов
    var operations: [String]? { get set }
    
    /// блок, вызывающийся при изменении результата
    var didChangeResultHandler: ((MVVMViewModelDelegate) -> ())? { get set}
    
    //блок, вызывающийся при изменении операций
    var didChangeOperationsHandler: ((MVVMViewModelDelegate) -> ())? { get set }
    
    init(dataManager: DataManagerProtocol, strings: Strings)
    
    /// инициализация пикера
//    ///
//    /// - Parameter operations: операции
//    func initializePickerView(operations: [String])
//    
//    //отображение сообщений
//    func showMessage(text: String?)
//    func printMessage(text: String?)
//    func showResult(firstValue: String, secondValue: String, operation: String, result: Double)
}
