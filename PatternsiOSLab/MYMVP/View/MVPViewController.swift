//
//  MVPViewController.swift
//  PatternsiOSLab
//
//  Created by Тимур Бадретдинов on 17/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class MVPViewController: UIViewController, MVPViewInput, UIPickerViewDelegate, UIPickerViewDataSource  {

    /// доступные методы
    var operations: [String]!
    /// презентер вьюшки
    var presenter: MVPViewOutput!
    
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

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        presenter.setupInitialize()
    }
    
     // MARK: - Setting pickerView
    
    /// устанавливаем названия методов для пикера
    func initializePickerView(operations: [String]) {
        self.operations = operations
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
    
    
    // MARK: - сообщения
    
    /// Отображение результата операции
    ///
    /// - Parameters:
    ///   - firstValue: первое значение, введенное пользователем
    ///   - secondValue: второе значение, введенное пользователем
    ///   - operation: операция, введенная пользователем
    ///   - result: результат операции
    func showResult(firstValue: String, secondValue: String, operation: String, result: Double) {
        tvResult.text = "\(firstValue) \(operation) \(secondValue) = \(result)"
    }
    
    /// Методя печатающий сообщения для разработчиков
    ///
    /// - Parameter text: сообщение, String
    func printMessage(text: String?) {
        print(text!)
    }
    
    /// отображение алерт диалога
    ///
    /// - Parameter text: текст сообщения
    func showMessage(text: String?) {
        let alert = UIAlertController(title: "", message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - callbacks
    
    /// Обработка нажатия кнопки
    @IBAction func btnCalculate(_ sender: Any) {
        let selectedValue = operations[pickerView.selectedRow(inComponent: 0)]
        presenter.didCalculatePressed(firstValue: firstValue.text!, secondValue: secondValue.text!, operation: selectedValue)
    }
}
