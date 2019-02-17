//
//  MVVMConfigurator.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class MVVMConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        //method for connecting View with Presenter
        configure()
    }
    
    func configure()  {
        
        guard let view = viewController as? MVVMViewController
            else { fatalError()}
        
        
        let data: DataManagerProtocol = DataManager()
        let strings = Strings()
        
        //Иньектируем в ViewModel dataManager и strings
        let viewModel = MVVMViewModel(dataManager: data, strings: strings)
        
        //устанавлием для вьюшки viewModel и string
        view.viewModel = viewModel
        view.strings = strings
    }
}
