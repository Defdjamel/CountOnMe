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
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTextView(){
         textView.text = calculator.getDisplay()
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if calculator.expressionHaveResult {
            textView.text = ""
            calculator.resetElement()
        }
        calculator.addElement(numberText)
        updateTextView()
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator && !calculator.expressionHaveResult {
            
            calculator.addElement(OperatorCalculator.addition.rawValue)
            updateTextView()
        } else {
           self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator && !calculator.expressionHaveResult {
            
            calculator.addElement(OperatorCalculator.substraction.rawValue)
            updateTextView()
        } else {
             self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
         if calculator.canAddOperator && !calculator.expressionHaveResult {
            calculator.addElement(OperatorCalculator.division.rawValue)
            updateTextView()
        } else {
            self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
         if calculator.canAddOperator && !calculator.expressionHaveResult {
            calculator.addElement(OperatorCalculator.multiplication.rawValue)
            updateTextView()
        } else {
             self.showAlertOk("Zéro!",  "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            return  self.showAlertOk("Zéro!",   "Entrez une expression correcte !")
        }
        guard calculator.expressionHaveEnoughElement else {
             return  self.showAlertOk("Zéro!",  "Démarrez un nouveau calcul !")
        }
        guard !calculator.expressionHaveResult else {
            return  self.showAlertOk("Zéro!",  "Démarrez un nouveau calcul !")
        }
        let result = calculator.calculTotal()
        calculator.addElement("=")
         calculator.addElement("\(result)")
        updateTextView()
    }

}
