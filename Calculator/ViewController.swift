//
//  ViewController.swift
//  Calculator
//
//  Created by Ievgeniia Pavliuchyk on 11/02/2019.
//  Copyright © 2019 Ievgeniia Pavliuchyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var isFirstDigit = true
    var operation1 : Double = 0
    var operation2 = "="
    
    var displayValue : Double {
        
        get {
            
            return NumberFormatter().number(from: label.text!)!.doubleValue
            
        }
        
        set {
            
            label.text = String(format: "%4.0f", newValue)
            isFirstDigit = true
            operation2 = "="
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func digitPressed(_ sender: AnyObject) {
        
        let digit = sender.currentTitle!
        label.text = isFirstDigit ? digit : label.text! + digit!
        isFirstDigit = false
        
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
    
    @IBAction func operation(_ sender: Any) {
    }
    
    @IBAction func calculation(_ sender: Any) {
    }
    
}

