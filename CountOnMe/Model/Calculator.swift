//
//  Calculator.swift
//  CountOnMe
//
//  Created by james on 07/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    var elements  : [String] = []
    
    var  expressionIsCorrect : Bool {
        guard let lastElement = elements.last else {
            return false
        }
        return !Calculator.operands.contains(lastElement)
    }
    
    var  expressionHaveEnoughElement:Bool {
        return elements.count >= 3
    }
    
    var canAddOperator:Bool {
        guard let lastElement = elements.last else {
            return false
        }
        return !Calculator.operands.contains(lastElement)
    }
    
    var expressionHaveResult: Bool {
        return elements.contains("=")
    }
    
    
    /// add a new operator or number
    ///
    /// - Parameter element: String 
    func addElement(_ element : String ){
        elements.append(element)
    }
    
    
    /// Restart a new calul
    func resetElement(){
        elements.removeAll()
    }
    
    /// return a human readable current operation
    ///
    /// - Returns: value to display
    func getDisplay()-> String{
        var text = ""
        for element in elements {
            text.append(" \(element) ")
        }
        return text
    }
    
   /// return  list operators used
   class var operands: [String] {
        return [OperatorCalculator.addition.rawValue, OperatorCalculator.substraction.rawValue, OperatorCalculator.division.rawValue,OperatorCalculator.multiplication.rawValue]
    }
    
    /// Calcul Total , manage  operator + - / x and priority
    ///
    /// - Parameter element: value and operant elements
    /// - Returns: Float(Total)
    func calculTotal() -> Float{
        
       var operationsToReduce = elements
       
        // Iterate over operations priority / and x
        var i = 0
       while operationsToReduce.count > 1 && i < (operationsToReduce.count - 1) {
            let left = Float(operationsToReduce[i])!
            let operand = operationsToReduce[i + 1]
            let right = Float(operationsToReduce[i + 2])!
            
            var result: Float?
            
            switch operand {
            case OperatorCalculator.multiplication.rawValue : result = left * right
            case  OperatorCalculator.division.rawValue : result = left / right
            default: break
                
            }
            
       
            if let result  = result {
                //remove operation
                operationsToReduce.remove(at: i)
                operationsToReduce.remove(at: i )
                operationsToReduce.remove(at: i )
                //add new result
                operationsToReduce.insert("\(result)", at: i)
            }else{
                i = i + 2
            }
        }
        
         // Iterate over operations + and _
         i = 0
        while operationsToReduce.count > 1 && i < (operationsToReduce.count - 1) {
            let left = Float(operationsToReduce[i])!
            let operand = operationsToReduce[i + 1]
            let right = Float(operationsToReduce[i + 2])!
            
            var result: Float?
            
            switch operand {
            case  OperatorCalculator.addition.rawValue : result = left + right
            case OperatorCalculator.substraction.rawValue: result = left - right
            default: break
                
            }
            
            if let result  = result {
                 //remove operation
                operationsToReduce.remove(at: i)
                operationsToReduce.remove(at: i )
                operationsToReduce.remove(at: i )
                //add new result
                operationsToReduce.insert("\(result)", at: i)
            }else{
                i = i + 2
            }
        }
        
      return Float(operationsToReduce.first!)!
    }
    
   
}
