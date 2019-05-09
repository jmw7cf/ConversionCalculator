//
//  ViewController.swift
//  ConversionCalculator
//
//  Created by Julia Wopata on 4/12/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import UIKit

class ConversionCalculatorViewController: UIViewController {
    
    var calc = ConversionCalculator()
    var inputString: String = ""
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func converterButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose a Conversion", message: nil , preferredStyle: .actionSheet)
        for (index, converters) in calc.converters.enumerated() {
            actionSheet.addAction(UIAlertAction(title: converters.label, style: .default, handler: { (actionSheetController) -> Void in
                self.calc.currentConverterIndex = index
                self.clear()
            }))
        }
        present( actionSheet , animated:  true , completion:  nil)
    }
    
    
    @IBAction func plusMinusButton(_ sender: Any) {
        if !inputString.contains("-") {
            inputString = "-" + inputString
        } else {
            inputString = inputString.replacingOccurrences(of: "-", with: "")
        }
        redraw()
    }
    
    
    @IBAction func clearButtton(_ sender: Any) {
         clear()
    }
    
    
    func clear() {
        inputString = ""
        redraw()
    }
    
    @IBAction func inputButton(_ sender: UIButton) {
        if sender.titleLabel!.text! == "." && inputString.contains(".") {
            return
        }
        inputString += sender.titleLabel!.text!
        redraw()
    }
    
    
    func redraw() {
        inputField.text = inputString + " " +  calc.currentConverter().inputUnit
        if inputString != "" {
            outputField.text = calc.convert(input: Float(inputString)!).description + calc.currentConverter().outputUnit
        } else {
            outputField.text = calc.currentConverter().outputUnit
        }
    }
}

