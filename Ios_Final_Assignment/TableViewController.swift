//
//  TableViewController.swift
//  Ios_Final_Assignment
//
//  Created by Shreya Karki on 12/16/21.
//

import UIKit
import CoreData


class TableViewController: UIViewController {
    
    public var fWeight : Float = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weightValue: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[PersonBmi]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: "CustomTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()

        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        //Fetch the data from Core data to display in the Table View
        
        do {
            self.items = try! context.fetch(PersonBmi.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        fWeight = (weightValue.text! as NSString).floatValue
        let newData = PersonBmi(context: self.context)
        newData.weight = fWeight
        let height = 1.7
        
        let calculateBmi = Float(fWeight) / Float(height * height)
        
        newData.date = Date()
        newData.bmi = calculateBmi
        
        items?.append(newData)
        
        do{
            try self.context.save()
        }
        catch{
            
        }
        
        self.fetchData()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let inputWeight: Float = Float((items![indexPath.row].value(forKey: "weight") as? NSNumber)!)
        
        let inputBmi: Float = Float((items![indexPath.row].value(forKey: "bmi") as? NSNumber)!)
        
        cell.config(BMI: inputBmi, Weight: inputWeight, date: Date())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = self.items![indexPath.row]
        
    }

}
