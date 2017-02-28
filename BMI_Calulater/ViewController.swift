//
//  ViewController.swift
//  BMI Calculater
//
//  Created by Chao Zhang on 2/26/17.
//  Copyright © 2017 Chao Zhang. All rights reserved.
//

import UIKit



var Key:Float = 1
var BMI:Float = 0
var Display = NSString(format: "%.2f",BMI)
var Height:Float = 0
var Weight:Float = 0

class ViewController: UIViewController,UITextFieldDelegate {
    //MARK: Properties
    
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var UIButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        UIButton.isEnabled = false
        heightTextField.addTarget(self,action: #selector(editingChanged(_:)), for: .editingChanged)
        weightTextField.addTarget(self,action: #selector(editingChanged(_:)), for: .editingChanged)
        heightTextField.placeholder="Input m／ft"
        weightTextField.placeholder="Input kg/lb"
        displayLabel.text = "Result"
        displayImageView.image = UIImage(named: "welcome")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
        
        //MARK: UITextFieldDelegate
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            //Hide the keyboard
            
            textField.resignFirstResponder()
            return true
        }
        
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // Avoid empty input
    func editingChanged(_ textField: UITextField) {
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let height = heightTextField.text, !height.isEmpty, let weight = weightTextField.text, !weight.isEmpty
            else {
                UIButton.isEnabled = false
                return
        }
        UIButton.isEnabled = true
    }
    
    //MARK: Action
    
    @IBAction func UISwitch(_ sender: UISwitch) {
        
        
        if sender.isOn{
            Key = 1
        }else{
            Key = 0.2049
        }
        
    }
    
    @IBAction func UIButton(_ sender: UIButton)
    {
        Height = Float(heightTextField.text!)!
        Weight = Float(weightTextField.text!)!
        BMI = Weight/Height/Height*Key
        switch BMI {
        case 0...16.0:
            displayLabel.text = (Display as String) + " Severe Thinness"
            displayImageView.image = UIImage(named: "sThin")
        case 16.0...16.9:
            displayLabel.text = (Display as String) + " Moderate Thinness"
            displayImageView.image = UIImage(named: "mThin")
        case 17.0...18.49:
            displayLabel.text = (Display as String) + " Mild  Thinness"
            displayImageView.image = UIImage(named: "MiThin")
        case 18.50...24.99:
            displayLabel.text = (Display as String) + " Normal Range"
            displayImageView.image = UIImage(named: "Normal")
        case 25.00...29.99:
            displayLabel.text = (Display as String) + " Overweight"
            displayImageView.image = UIImage(named: "over")
        case 30.0...34.99:
            displayLabel.text = (Display as String) + " Obese Class I"
            displayImageView.image = UIImage(named: "O1")
        case 35.0...39.99:
            displayLabel.text = (Display as String) + " Obese Class II"
            displayImageView.image = UIImage(named: "O2")
            
        default:
            displayLabel.text = (Display as String) + " Obese Class III"
            displayImageView.image = UIImage(named: "O3")
        }
        
    }
}
      
