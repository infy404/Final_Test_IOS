//
//  ViewController.swift
//  Ios_Final_Assignment
//
//  Created by Shreya Karki on 12/16/21.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    public var fHeight: Float = 0
    public var fWeight: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        (UIApplication.shared.delegate as!
         AppDelegate).persistentContainer.viewContext
    }

    @IBOutlet weak var unitSwitch: UISwitch!
    
    @IBOutlet weak var displayBmi: UILabel!
    
    @IBOutlet weak var insertHeight: UITextField!
    @IBOutlet weak var insertWeight: UITextField!
    
    @IBOutlet weak var bmiClass: UILabel!
    @IBOutlet weak var metricSwitch: UISwitch!
    
    @IBAction func calculateTap(_ sender: Any) {
        
        fHeight = (insertHeight.text! as NSString).floatValue
        fWeight = (insertWeight.text! as NSString).floatValue
        
        
        let calculateBmi: Float
        
        if metricSwitch.isOn{
            //Calculate in metric
            calculateBmi = fWeight / (fHeight * fHeight)
        }
        else
        {
            //Calculate in Imperial
            calculateBmi = (fWeight * 703) / (fHeight * fHeight)
            
        }
        
        let finalBMI = NSString(format : "%.2f", calculateBmi) as String
        
        displayBmi.text = finalBMI
        
        if calculateBmi < 16{
            bmiClass.text = "Severe Thinness"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.red
        } else if calculateBmi > 16 && calculateBmi < 17 {
            bmiClass.text = "Moderate Thinness"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.systemPink
        }
        else if calculateBmi > 17 && calculateBmi < 18.5 {
            bmiClass.text = "Mild Thinness"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.green
        }
        else if calculateBmi > 18.5 && calculateBmi < 25 {
            bmiClass.text = "Normal"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.systemGreen
        }
        else if calculateBmi > 25 && calculateBmi < 30 {
            bmiClass.text = "Overweight"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.systemPink
        }
        else if calculateBmi > 30 && calculateBmi < 35 {
            bmiClass.text = "Obese Class I"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.red
        }
        else if calculateBmi > 35 && calculateBmi < 40 {
            bmiClass.text = "Obese Class II"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.red
        }
        else if calculateBmi > 40 {
            bmiClass.text = "Obese Class III"
            bmiClass.adjustsFontSizeToFitWidth = true
            bmiClass.textColor = UIColor.red
        }
                
    }
    
}

