//
//  Extensions.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation


extension String {
    
    /// определить, является ли строковое значение значением Double
    var isDouble: Bool {
        return Double(self) != nil
    }
}
