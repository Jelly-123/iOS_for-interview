//
//  main.swift
//  Valid Parentheses
//
//  Created by sz on 2019/3/5.
//  Copyright © 2019 Qin. All rights reserved.
//

import Foundation

struct Stack{
    fileprivate var array: [String] = []
    public init() {}
    mutating func push(_ element:String){
        array.append(element)
    }
    mutating func pop() -> String?{
        
        return array.popLast()
    }
    func peek() -> String? {
        return array.last
    }
    func isImpty() -> Bool?{
        if array.count == 0{
            return true
        }else{
            return false
        }
    }
}

func isValid(_ s: String) -> Bool {
    let array = Array(s)
    var newStack = Stack()
    for value in array {
        let tmp = newStack.peek()
        if value == "(" || value == "[" || value == "{"{
            newStack.push(String(value))
        }else{
            switch value {
            case ")": do {
                if tmp == "("{
                    _ = newStack.pop()
                }
                else{
                        newStack.push(String(value))
                }
            }
            case "]": do{
                if tmp == "["{
                    _ = newStack.pop()
                }else{
                    newStack.push(String(value))
                }
            }
            case "}": do{
                if tmp == "{"{
                    _ = newStack.pop()
                }else{
                    newStack.push(String(value))
                }
                }
            default:
                fatalError("Input invalid")
            }
        }
    }
    if newStack.isImpty() ?? true{
          return true
    }else{
        return false
    }
  
}

print(isValid("([)]"))

