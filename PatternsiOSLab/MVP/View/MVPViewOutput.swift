//
//  MVPViewOutput.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol MVPViewOutput {
    
    /// Метод, вызывающийся после нажатия на кнопку "Посчитать"
    ///
    /// - Parameters:
    ///   - firstValue: значение первого поля
    ///   - secondValue: значение второго поля
    ///   - operation: значение пикера
    func didCalculatePressed(firstValue: String, secondValue: String, operation: String)
    
    /// начальная инициализация
    func setupInitialize()
}
