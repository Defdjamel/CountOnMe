//
//  Calculator.swift
//  CountOnMe
//
//  Created by james on 07/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

/// OperatorCalculator enumeration of operators
///
/// - addition: +
/// - substraction: -
/// - division: /
/// - multiplication: x
public enum OperatorCalculator : String{
    case addition = "+"
    case substraction = "-"
    case division = "/"
    case multiplication = "x"
}


class Calculator: NSObject {
    
   /// return  list operators used
   class var operands: [String] {
        return [OperatorCalculator.addition.rawValue, OperatorCalculator.substraction.rawValue, OperatorCalculator.division.rawValue,OperatorCalculator.multiplication.rawValue]
    }
    
    /// Calcul Total , manage  operator + - / x and priority
    ///
    /// - Parameter element: value and operant elements
    /// - Returns: Float(Total)
    func calculTotal(_ elements : [String]) -> Float{
        
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
