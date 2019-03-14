//
//  main.swift
//  ReverseInteger_swift
//
//  Created by sz on 2019/2/27.
//  Copyright © 2019 Qin. All rights reserved.
//

import Foundation

func reverse(_ x: Int) -> Int {
    
    let val = Int32(String(String(abs(x)).reversed())) ?? 0
    return x > 0 ? Int(val) : Int(val) * -1
    
}
print("ddd",reverse(123))


