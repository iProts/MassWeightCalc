//
//  FirstViewController.swift
//  mass weight
//
//  Created by Игорь Процько on 01.08.17.
//  Copyright © 2017 Ihor Protsko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    var bmr: Double = 0
    var bmi: Double = 0
    var age: Int = 1
    var height: Int = 1
    var weight: Int = 1
    
    @IBAction func calculateTapped(_ sender: Any) {
        age = Int(ageTextField.text!)!
        height = Int(heightTextField.text!)!
        weight = Int(weightTextField.text!)!
        switch sexSegmentedControl.selectedSegmentIndex {
        case 0:
            bmr = 447.593 + 9.247 * Double(weight) + 3.098 * Double(height) - 4.330 * Double(age)
        case 1:
            
            bmr = 88.362 + 13.397 * Double(weight) + 4.799 * Double(height) - 5.677 * Double(age)
            
        default: bmr = 0
        }
        bmi = Double(weight) / pow(Double(height) / 100, 2)
        
        
        
        
        let factor = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor = factor[activitySegmentedControl.selectedSegmentIndex]
        bmr *= selectedFactor
        resultLabel.text = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела \(Int(bmi))."
        UIApplication.shared.keyWindow!.endEditing(true)
        
    }
}

