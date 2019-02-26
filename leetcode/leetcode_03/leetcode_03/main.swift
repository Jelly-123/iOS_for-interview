//
//  main.swift
//  leetcode_03
//
//  Created by sz on 2019/2/25.
//  Copyright © 2019 Qin. All rights reserved.
//  two_sum

import Foundation

//force soluation
func twoSum(_ nums:[Int], _ target:Int) -> [Int] {
    
    let count :Int = nums.count
    
    for i in 0..<count - 1{
        
        for j in (i+1)..<count{
            
            if nums[j]+nums[i] == target{
                return[i,j]
            }
        }
        
    }
    
    return []
    
}

//hash table

func twoSum_hash(_ nums:[Int],_ target:Int) -> [Int] {
    var dict = [Int: Int]() //init a dict
    for (index,value) in nums.enumerated() {
        if let lastIndex = dict[target - value]{
            return [lastIndex,index]
        }
        dict[value] = index
    }
    fatalError("No valid outputs")
    
}

var array = [2,7,11,8]

print("result:",twoSum(array, 15))

print("hash_result:",twoSum_hash(array, 15))

var dict : Dictionary = ["qinhuan":20,"lichaoxian":23]
print(dict["qinhuan"]!)
dict["wuxiao"] = 88
print(dict                                                                                                                                                                                         )
var array1:Array<Int>=[]
print(array1)

var optionStr :String? = "woshiyizhizhu"
print(optionStr == nil)
