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
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currencyControl: UISegmentedControl!
    @IBOutlet weak var newBillLabel: UILabel!
    
    let defaults = UserDefaults.standard
    let funPurple = UIColor(red: 148/255.0, green: 67/255.0, blue: 251/255.0, alpha: 1.0)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // retrieve default tip amounts from defaults storage
        // if it does not exist yet in storage, then set the default tip amounts manually
        if(defaults.object(forKey: "default1") == nil){
            let default1 = String(18)
            tipControl.setTitle(default1, forSegmentAt: 0)
        }
        else {
            let default1 = defaults.string(forKey: "default1")
            tipControl.setTitle(default1, forSegmentAt: 0)
        }
        
        if(defaults.object(forKey: "default2") == nil){
            let default2 = String(20)
            tipControl.setTitle(default2, forSegmentAt: 1)
        }
        else {
            let default2 = defaults.string(forKey: "default2")
            tipControl.setTitle(default2, forSegmentAt: 1)
        }
        
        if(defaults.object(forKey: "default3") == nil){
            let default3 = String(25)
            tipControl.setTitle(default3, forSegmentAt: 2)
        }
        else {
            let default3 = defaults.string(forKey: "default3")
            tipControl.setTitle(default3, forSegmentAt: 2)
        }
        
        // if the theme setting does not exist in storage, then add it to storage with the fun theme as default
        if (defaults.string(forKey: "theme") == nil) {
            defaults.set(0, forKey: "theme" )
        }
        
        // if the first segmented control option is selected, make the background purple
        if (defaults.integer(forKey: "theme") == 0) {
            self.view.backgroundColor = funPurple
            self.billField.backgroundColor = funPurple
        }
        
        // if the second segmented control option is selected, make the background white
        else if (defaults.integer(forKey: "theme") == 1) {
            self.view.backgroundColor = UIColor.black
            self.billField.backgroundColor = UIColor.black
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.totalLabel.alpha = 0
        self.totalTitleLabel.alpha = 0
        print(0)
        
        // set variables for totalLabel positions
        let xPosition = totalLabel.frame.origin.x
        let yPosition = totalLabel.frame.origin.y
        let height = totalLabel.frame.size.height
        let width = totalLabel.frame.size.width
        
        // set variables for totalTitleLabel positions
        let xPositionTitle = totalTitleLabel.frame.origin.x
        let yPositionTitle = totalTitleLabel.frame.origin.y
        let heightTitle = totalTitleLabel.frame.size.height
        let widthTitle = totalTitleLabel.frame.size.width
        
        // set starting position for elements 20px lower
        self.totalLabel.frame = CGRect(x: xPosition, y: yPosition + 20, width: width, height: height)
        self.totalTitleLabel.frame = CGRect(x: xPositionTitle, y: yPositionTitle + 20, width: widthTitle, height: heightTitle)
        
        // animate
        UIView.animate(withDuration: 2, animations: {
            
            // elements will fade in
            self.totalLabel.alpha = 1
            self.totalTitleLabel.alpha = 1
            
            // elements will slide up
            self.totalLabel.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            self.totalTitleLabel.frame = CGRect(x: xPositionTitle, y: yPositionTitle, width: widthTitle, height: heightTitle)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // on opening of app, keyboard will be up and user can immediately start typing in the bill field
        billField.becomeFirstResponder()
        
        // make fonts extra light
        billField.font = UIFont.systemFont(ofSize: 64, weight: UIFontWeightUltraLight)
        tipTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightUltraLight)
        totalTitleLabel.font = UIFont.systemFont(ofSize: 23, weight: UIFontWeightUltraLight)
        tipLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightUltraLight)
        totalLabel.font = UIFont.systemFont(ofSize: 23, weight: UIFontWeightUltraLight)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // call on every edit of the bill field
    @IBAction func calculateTip(_ sender: AnyObject) {
        let selectedCurrency = currencyControl.titleForSegment(at: currencyControl.selectedSegmentIndex)
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let currencies = [1, 0.85, 0.77, 110.16]
        
        let bill = Double(billField.text!) ?? 0
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        // 2 decimal places
        numberFormatter.minimumFractionDigits = 2
        
        // convert to updated currency
        let newBill = bill * currencies[currencyControl.selectedSegmentIndex]
        
        // add tip
        let tip = newBill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = newBill + tip
        
        // format values with commas
        let formattedBill = numberFormatter.string(from: NSNumber(value:newBill))
        let formattedTip = numberFormatter.string(from: NSNumber(value:tip))
        let formattedTotal = numberFormatter.string(from: NSNumber(value:total))
        
        // populate labels
        newBillLabel.text = selectedCurrency! + formattedBill!
        tipLabel.text = selectedCurrency! + formattedTip!
        totalLabel.text = selectedCurrency! + formattedTotal!
    }


}

