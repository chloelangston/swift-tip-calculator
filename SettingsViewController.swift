//
//  SettingsViewController.swift
//  tip_calculator
//
//  Created by Chloe Langston on 8/14/17.
//  Copyright © 2017 Chloe Langston. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipDefaultInput: UITextField!
    @IBOutlet weak var tipDefaultInput2: UITextField!
    @IBOutlet weak var tipDefaultInput3: UITextField!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set default tip amounts from the default storage
        tipDefaultInput.text = defaults.string(forKey: "default1")
        tipDefaultInput2.text = defaults.string(forKey: "default2")
        tipDefaultInput3.text = defaults.string(forKey: "default3")
        
        // set the theme from the default storage
        themeControl.selectedSegmentIndex = defaults.integer(forKey: "theme")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // if the first default tip amount was edited, store new default
    @IBAction func changeDefault(_ sender: AnyObject) {
        let default1 = Double(tipDefaultInput.text!)
        defaults.set(default1, forKey: "default1" )
        defaults.synchronize()
    }
    
    // if the second default tip amount was edited, store new default
    @IBAction func changeDefault2(_ sender: Any) {
        let default2 = Double(tipDefaultInput2.text!)
        defaults.set(default2, forKey: "default2" )
        defaults.synchronize()
    }

    // if the third default tip amount was edited, store new default
    @IBAction func changeDefault3(_ sender: Any) {
        let default3 = Double(tipDefaultInput3.text!)
        defaults.set(default3, forKey: "default3" )
        defaults.synchronize()
    }
    
    // if the theme setting was updated, store new theme
     @IBAction func changeTheme(_ sender: AnyObject) {
        if (themeControl.selectedSegmentIndex == 0) {
            defaults.set(0, forKey: "theme" )
        }
        if (themeControl.selectedSegmentIndex == 1) {
            defaults.set(1, forKey: "theme" )
        }
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
