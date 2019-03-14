//
//  main.swift
//  Add_Binary_67
//
//  Created by 焕焕 on 2019/3/14.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func addBinary(_ a: String, _ b: String) -> String {
    var aarray = Array(a)
    var barray = Array(b)
    
    var i = aarray.count - 1
    var j = barray.count - 1
    var sum = 0
    var result = ""
    while i >= 0 || j >= 0 || sum == 1 {
        sum += (i >= 0) ? Int(String(aarray[i]))! : 0
        sum += (j >= 0) ? Int(String(barray[j]))! : 0
        result = String((sum%2)) + result
        sum = sum / 2
        i -= 1
        j -= 1
    }
    return result
}
let a = "11"
let b = "1"
print(addBinary(a, b))


