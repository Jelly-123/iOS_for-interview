//
//  main.swift
//  Maximum Subarray_53
//
//  Created by 焕焕 on 2019/3/12.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var max = nums[0]
    var sum = nums[0]
    for i in (1..<nums.count){
        sum += nums[i]
        if nums[i] > sum{
            sum = nums[i]
        }
        if sum > max{
            max = sum
        }
    }//end for i
    return max
}
func lengthOfLastWord(_ s: String) -> Int {
//    return s.split(separator:" ").last?.count ?? 0
    let array : Array = s.split(separator:" ")
    return array.last?.count ?? 0
}
let test = "a "
print(lengthOfLastWord(test))
let nums = [-2,1,-3,4,-1,2,1,-5,4]
print(maxSubArray(nums))

