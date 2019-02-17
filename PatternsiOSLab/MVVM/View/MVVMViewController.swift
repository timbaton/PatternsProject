//
//  MVVMViewController.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  
    /// строки
    var strings: Strings!
    
    /// методы
    @IBOutlet weak var pickerView: UIPickerView!
    /// первое значение
    @IBOutlet weak var firstValue: UITextField!
    /// второе значение
    @IBOutlet weak var secondValue: UITextField!
    /// поле для результата
    @IBOutlet weak var tvResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        operations = []
g        viewModel?.didLoad()
    }
    
    /// биндинг viewModel
    var viewModel: MVVMViewModel?{
        didSet{
            viewModel?.didChangeResultHandler = { [weak self] delegate in
                self?.tvResult.text = "\(delegate.result)"
            }
        }
    }
    
    // MARK: - Setting pickerView
    
    /// обновление пикера
    var operations: [String]! {
        didSet{
            viewModel?.didChangeOperationsHandler = { [weak self] delegate in
                self?.operations = delegate.operations
                self?.pickerView.reloadAllComponents()
            }
        }
    }
    
    /// установка кол-ва колонок для пикера
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operations[row]
    }
    
    /// Установка мощности пикера
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operations.count
    }
    
    /// Обработка нажатия кнопки
    @IBAction func btnCalculate(_ sender: Any) {
        let selectedValue = operations[pickerView.selectedRow(inComponent: 0)]
        viewModel?.didCalculatePressed(firstValue: firstValue.text!, secondValue: secondValue.text!, operation: selectedValue)
    }
}
