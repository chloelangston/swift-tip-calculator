//
//  ViewController.swift
//  tip_calculator
//
//  Created by Chloe Langston on 8/14/17.
//  Copyright © 2017 Chloe Langston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currencyControl: UISegmentedControl!
    @IBOutlet weak var newBillLabel: UILabel!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        if(defaults.object(forKey: "default1") == nil){
            let default1 = String(18)
            tipControl.setTitle(default1, forSegmentAt: 0)
            print("1 doesn't exist")
        }
        else {
            let default1 = defaults.string(forKey: "default1")
            tipControl.setTitle(default1, forSegmentAt: 0)
            print("1 exists")
        }
        
        if(defaults.object(forKey: "default2") == nil){
            let default2 = String(20)
            tipControl.setTitle(default2, forSegmentAt: 1)
            print("2 doesn't exist")
        }
        else {
            let default2 = defaults.string(forKey: "default2")
            tipControl.setTitle(default2, forSegmentAt: 1)
            print("2 exists")
        }
        
        if(defaults.object(forKey: "default3") == nil){
            let default3 = String(25)
            tipControl.setTitle(default3, forSegmentAt: 2)
        }
        else {
            let default3 = defaults.string(forKey: "default3")
            tipControl.setTitle(default3, forSegmentAt: 2)
        }
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let currencies = [1, 0.85, 0.77, 110.16]
        
        let bill = Double(billField.text!) ?? 0
        let newBill = bill * currencies[currencyControl.selectedSegmentIndex]
        
        let tip = newBill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = newBill + tip
        
        newBillLabel.text = String(format: "$%.2f", newBill)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }


}

