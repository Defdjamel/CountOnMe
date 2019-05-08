//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    var calculator = Calculator()
    
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    
    var expressionIsCorrect: Bool {
        guard let lastElement = elements.last else {
            return false
        }
        return !Calculator.operands.contains(lastElement)
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        guard let lastElement = elements.last else {
            return false
        }
        return !Calculator.operands.contains(lastElement)
    }
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator && !expressionHaveResult {
            textView.text.append(" \(OperatorCalculator.addition.rawValue) ")
        } else {
           self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator && !expressionHaveResult {
            textView.text.append(" \(OperatorCalculator.substraction.rawValue) ")
        } else {
             self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if canAddOperator && !expressionHaveResult {
            textView.text.append(" \(OperatorCalculator.division.rawValue) ")
        } else {
            self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if canAddOperator && !expressionHaveResult {
            textView.text.append(" \(OperatorCalculator.multiplication.rawValue) ")
        } else {
             self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            return  self.showAlertOk("Zéro!",   "Entrez une expression correcte !")
        }
        guard expressionHaveEnoughElement else {
             return  self.showAlertOk("Zéro!",  "Démarrez un nouveau calcul !")
        }
        guard !expressionHaveResult else {
            return  self.showAlertOk("Zéro!",  "Démarrez un nouveau calcul !")
        }
        let result = calculator.calculTotal(elements)
        
        textView.text.append(" = \(result)")
    }

}

