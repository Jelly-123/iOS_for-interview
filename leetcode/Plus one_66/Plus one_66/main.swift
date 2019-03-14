//
//  main.swift
//  Plus one_66
//
//  Created by 焕焕 on 2019/3/13.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation
func plusOne(_ digits: [Int]) -> [Int] {
    var digits:Array = digits
    for i in (0..<digits.count).reversed(){
        if digits[i] < 9{
            digits[i] = digits[i] + 1
            return digits
        }//个位为小于9的直接返回
        digits[i] = 0   //如果为9，则置0
    }//end for i
    var array = [Int](repeating: 0, count: digits.count+1)
    array[0] = 1
    return array
}
print(plusOne([9]))
print("Hello, World!")

func myAtoi(_ str: String) -> Int {
    var result = 0
    var onlyDigit = false
    var sign = 1
    for char in str{
        switch char{
        case " ":
            if onlyDigit{
                return result
            }else{
                continue
            }
        case "+":
//            sign = 1
            fallthrough
        case "-":
//            sign = -1
            if onlyDigit{
                return result
            }else{
                onlyDigit = true
                sign = char == "+" ? 1 : -1
            }
        case "0"..."9":
            result = (result * 10 + Int(String(char))! * sign)
            onlyDigit = true
            if result > Int32.max{
                return Int(Int32.max)
            }else if result < Int32.min{
                return Int(Int32.min)
            }
        default:
            return result
        }
    }
    return result
}
print(myAtoi("   +0 123"))

