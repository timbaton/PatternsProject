//
//  MVPViewInput.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol MVPViewInput: AnyObject {
    
    /// инициализация пикера
    ///
    /// - Parameter operations: операции
    func initializePickerView(operations: [String])
    
    //отображение сообщений
    func showMessage(text: String?)
    func printMessage(text: String?)
    func showResult(firstValue: String, secondValue: String, operation: String, result: Double)
}
