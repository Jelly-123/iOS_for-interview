//
//  main.swift
//  Search Insert Position_35
//
//  Created by 焕焕 on 2019/3/8.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var result : Int = 0
    for (index,value) in nums.enumerated(){
        if value >= target{
            return index
        }
        result = index
    }
    
    return result+1
}
print(searchInsert([1,2,3,4], 5))
print("Hello, World!")

