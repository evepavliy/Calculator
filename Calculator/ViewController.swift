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
    
    var isFirstDigit = true // check whether anything was entered before
    var operation1 : Double = 0 // variable to store first number of equestion 
    var operation2 = "=" // variable to save currently applied operation
    
    var displayValue : Double { //resulting value
        
        //how entered number is formatted to be Double
        get {
            
            return NumberFormatter().number(from: label.text!)!.doubleValue
            
        }
        //when a new displayValue is calcualted, we format it and make preperation for next calculation
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
        label.text = "0"
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        
        operation2 = sender.currentTitle!
        operation1 = displayValue
        isFirstDigit = true
    }
    
    @IBAction func calculation(_ sender: Any) {
        
        switch operation2 {
        case "+" :
            displayValue += operation1
        case "*" :
            displayValue *= operation1
        case "-" :
            displayValue = operation1 - displayValue
        case "/" :
            displayValue = operation1 / displayValue
            
        default:
          break
        }
    }
    
    
}

