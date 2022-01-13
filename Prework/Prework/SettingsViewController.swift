//
//  SettingsViewController.swift
//  Prework
//
//  Created by Gyandeep Reddy on 1/5/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    @IBOutlet weak var colorTheme: UISegmentedControl!
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        super.viewWillAppear(animated)
        tipPercentage.selectedSegmentIndex = defaults.integer(forKey: "tipPercentage")
        let theme = defaults.integer(forKey: "colorTheme")
        if(theme == 0){
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
        }
        colorTheme.selectedSegmentIndex = theme
        let arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        if(arr.count >= 1){
            tip1TextField.text = arr[0]
            tipPercentage.setTitle(arr[0], forSegmentAt: 0)
        }
        if(arr.count >= 2){
            tip2TextField.text = arr[1]
            tipPercentage.setTitle(arr[1], forSegmentAt: 1)
        }
        if(arr.count >= 3){
            tip3TextField.text = arr[2]
            tipPercentage.setTitle(arr[2], forSegmentAt: 2)
        }
    }
    

    @IBAction func saveDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipPercentage.selectedSegmentIndex, forKey: "tipPercentage")
        defaults.synchronize()
    }
    
    
    @IBAction func saveColorTheme(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(colorTheme.selectedSegmentIndex, forKey: "colorTheme")
        defaults.synchronize()
        if(defaults.integer(forKey: "colorTheme") == 0){
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
        }
    }
    
    @IBAction func setTip1(_ sender: Any) {
        let defaults = UserDefaults.standard
        var arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        print(arr.count)
        print(arr)
        if(arr.count >= 1){
            arr[0] = tip1TextField.text ?? "15%"
        }else{
            arr.append(tip1TextField.text ?? "15%")
        }
        defaults.set(arr, forKey: "defaultTipPercentages")
        tipPercentage.setTitle(tip1TextField.text, forSegmentAt: 0)
    }
    
    @IBAction func setTip2(_ sender: Any) {
        let defaults = UserDefaults.standard
        var arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        if(arr.count >= 2){
            arr[1] = tip2TextField.text ?? "18%"
        }else{
            arr.append(tip2TextField.text ?? "18%")
        }
        defaults.set(arr, forKey: "defaultTipPercentages")
        tipPercentage.setTitle(tip2TextField.text, forSegmentAt: 1)
    }
    
    @IBAction func setTip3(_ sender: Any) {
        let defaults = UserDefaults.standard
        var arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        if(arr.count >= 3){
            arr[2] = tip3TextField.text ?? "20%"
        }else{
            arr.append(tip3TextField.text ?? "20%")
        }
        defaults.set(arr, forKey: "defaultTipPercentages")
        tipPercentage.setTitle(tip3TextField.text, forSegmentAt: 2)
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
