//
//  ViewController.swift
//  Prework
//
//  Created by Gyandeep Reddy on 1/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.keyboardType = UIKeyboardType.numberPad
        billAmountTextField.becomeFirstResponder()
        let time = NSDate()
        let timeElapsed = Double(time.timeIntervalSince((UserDefaults.standard.object(forKey: "previousTime") as? NSDate ?? time) as Date))
        
        if(timeElapsed <= 600){
            billAmountTextField.text = UserDefaults.standard.string( forKey:"billAmount") ?? ""
        }
        
        if(billAmountTextField.text != ""){
            calculate(isTipControl: false)
        }
        
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipPercentage")
        calculate(isTipControl: false)
        if(defaults.integer(forKey: "colorTheme") == 0){
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
        }
        let arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        if(arr.count >= 1){
            tipControl.setTitle(arr[0], forSegmentAt: 0)
        }
        if(arr.count >= 2){
            tipControl.setTitle(arr[1], forSegmentAt: 1)
        }
        if(arr.count >= 3){
            tipControl.setTitle(arr[2], forSegmentAt: 2)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculate(isTipControl: true)
    }
    
    func calculate(isTipControl: Bool){
        let bill = Double(billAmountTextField.text!) ?? 0
        var tipPercentages = [0.15, 0.18, 0.2]

        let defaults = UserDefaults.standard
        let arr = defaults.array(forKey: "defaultTipPercentages") as? [String] ?? []
        if(arr.count >= 1){
            let start = arr[0].startIndex
            let end = arr[0].firstIndex(of: "%") ?? arr[0].endIndex
            
            let range = start..<end
            let value = (Double(Int(arr[0][range]) ?? 15) / 100.0)
            tipPercentages[0] = value
        }
        if(arr.count >= 2){
            let start = arr[1].startIndex
            let end = arr[1].firstIndex(of: "%") ?? arr[1].endIndex
            
            let range = start..<end
            let value = (Double(Int(arr[1][range]) ?? 18) / 100.0)
            tipPercentages[1] = value
        }
        if(arr.count >= 3){
            let start = arr[2].startIndex
            let end = arr[2].firstIndex(of: "%") ?? arr[2].endIndex
            
            let range = start..<end
            let value = (Double(Int(arr[2][range]) ?? 20) / 100.0)
            tipPercentages[2] = value
        }
        
        var tip = 0.0
        
        if(isTipControl){
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }else{
           tip = bill * tipPercentages[defaults.integer(forKey: "tipPercentage")]
        }
        
        let total = bill + tip
        let fmt = NumberFormatter()
        fmt.numberStyle = NumberFormatter.Style.currency
        tipAmountLabel.text = fmt.string(for:  tip)
        totalLabel.text = fmt.string(for: total)
    }
    
    @IBAction func calculateTotal(_ sender: Any) {
        calculate(isTipControl: false)
    }
    
    @IBAction func billAmountEnding(_ sender: Any) {
        UserDefaults.standard.set(billAmountTextField.text, forKey:"billAmount")
        UserDefaults.standard.set(NSDate(), forKey:"previousTime")
    }
}

