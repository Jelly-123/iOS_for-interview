//
//  main.swift
//  Roman to Integer_13
//
//  Created by sz on 2019/3/5.
//  Copyright © 2019 Qin. All rights reserved.
//

import Foundation
func romanToInt(_ s: String) -> Int {
    var dict : [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    var result = 0
    var pre = 0
    let array = Array(s)
    print(array)
    for (index,value) in array.enumerated().reversed(){
        if dict[value]! >= pre {
             //如果后面的比前面的大，则做加法操作
            result = dict[value]! + result
        }else{
            result = result - dict[value]!
        }
        pre = dict[value]!
        if index-1 < 0 {
            break
        }
    }
    return result
    
}

print(romanToInt("LVIII"))
print("Hello, World!")

