//
//  main.swift
//  Longest Palindromic Substring_05
//
//  Created by 焕焕 on 2019/3/10.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 {
        return s
    }
    var maxlength = 0
    var start :Int = 0
    var sarray = Array(s)
    //odd
    for i in 1..<sarray.count-1 {
        var left = i - 1
        var right = i + 1
        while left >= 0 && right < sarray.count && sarray[left] == sarray[right]{
            //中心扩散法
            if maxlength < right-left+1{
                maxlength = right - left + 1
                start = left
            }//end if
            left -= 1
            right += 1
        }//end while
    }
    
        for i in 0..<sarray.count-1 {
            var left = i
            var right = i+1
            while left >= 0 && right < sarray.count && sarray[left] == sarray[right]{
                //中心扩散法
                if maxlength < right-left+1{
                    maxlength = right - left + 1
                    start = left
                }//end if
                left -= 1
                right += 1
            }//end while
        }

    if maxlength == 0 {
        return String(sarray[0])
    }
  
     let result: String = String(sarray[start..<start+maxlength])
    
    return result
}
print(longestPalindrome("bb"))

