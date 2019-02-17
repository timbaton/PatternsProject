//
//  DataManager.swift
//  PatternsiOSLab
//
//  Created by Ильдар Залялов on 11/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    
    /// получить необходимые методы
    ///
    /// - Returns: массив строк
    func obtainOperations() -> [String]
}

/// вспомогательный класс, предоставляющий проекту данные
class DataManager: DataManagerProtocol {
    
    /// получить необходимые методы
    ///
    /// - Returns: массив строк
    func obtainOperations() -> [String] {
        return ["+", "-", "*", "/", "%", "^"]
    }
}
