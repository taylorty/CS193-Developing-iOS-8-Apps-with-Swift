//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Tongyu on 12/22/15.
//  Copyright © 2015 Tongyu. All rights reserved.
//

import Foundation

class CaculatorBrain {
    enum Op{
        case Operand(Double)
        case UnaryOperation(String, Double->Double)
        case BinaryOperation(String, (Double, Double)->Double)
        
    }
    private var opStack = [Op]()
    
    var knownOps = [String: Op]()
    
    init(){
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
        
    }
    func performOperation(symbol:String){
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
}