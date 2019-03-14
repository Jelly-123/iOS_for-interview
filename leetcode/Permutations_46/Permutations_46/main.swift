//
//  main.swift
//  Permutations_46
//
//  Created by 焕焕 on 2019/3/14.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var input = nums
    permuteUtil(&input, 0, &result)
    return result
}
func permuteUtil(_ nums:inout [Int], _ begin:Int,_ result:inout [[Int]]){
      if begin >= nums.count {
        result.append(nums)
        return
    }
    else{
        for i in begin..<nums.count{
            (nums[i],nums[begin]) = (nums[begin],nums[i])
            permuteUtil(&nums, begin+1, &result)
            (nums[i],nums[begin]) = (nums[begin],nums[i])
        }
    }
    
}
let input = [1,2,3]
print(permute(input))
