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
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipDefaultInput.text = defaults.string(forKey: "default1")
        tipDefaultInput2.text = defaults.string(forKey: "default2")
        tipDefaultInput3.text = defaults.string(forKey: "default3")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDefault(_ sender: AnyObject) {
        let default1 = Double(tipDefaultInput.text!)
        defaults.set(default1, forKey: "default1" )
        print("default set 1")
        print(defaults.string(forKey: "default1") ?? "no default 1 was set")
        defaults.synchronize()

    }
    
    @IBAction func changeDefault2(_ sender: Any) {
        let default2 = Double(tipDefaultInput2.text!)
        defaults.set(default2, forKey: "default2" )
        print("default set 2")
        print(defaults.string(forKey: "default2") ?? "no default 2 was set")
        defaults.synchronize()
    }

    @IBAction func changeDefault3(_ sender: Any) {
        let default3 = Double(tipDefaultInput3.text!)
        defaults.set(default3, forKey: "default3" )
        defaults.synchronize()
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
