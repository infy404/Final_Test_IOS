//
//  CustomTableViewCell.swift
//  Ios_Final_Assignment
//
//  Created by Shreya Karki on 12/17/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    
    public func config(BMI: Float, Weight: Float, date: Date){
        let currentDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/mm/dd"
        
        dateLabel.text = dateFormatter.string(from: currentDate)
        bmiLabel.text = NSString(format: "%.2f", BMI) as String
        weightLabel.text = NSString(format: "%.2f", Weight) as String
    }
}
