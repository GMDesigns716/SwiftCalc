//
//  ViewController.swift
//  calculator
//
//  Created by Robert B on 11/10/19.
//  Copyright © 2019 lambda school. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain ()
    }
    
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(digit)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorDigit = sender.titleLabel?.text {
            brain?.setOperator(operatorDigit)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
            outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
       brain = nil
        brain = CalculatorBrain()
    }
}
