//
//  main.swift
//  leetcode_03_swift
//
//  Created by sz on 2019/2/25.
//  Copyright © 2019 Qin. All rights reserved.
//  对字符串的操作

import Foundation

/*
 此题为最长的无重复子串，之前的思路是夹中间。右边第一个看是否在这个子串里，如果在则剔除。不在的话向左移动。左边的同理
 如果字符串为abcabcaa   bbbbbb都可以测出来
 但若为pwwkew，则不符合所想算法。右边指针到e停止，左边检测p的时候发现不在子串里，则就停止了。
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    //1.首先将字符串改为数组
    let array = Array(s)
    var longest = 0,left = 0,set = Set<Character>()
    //set不含重复原序，可以利用这一特性解题
    for (i,char) in s.enumerated() {
        if set.contains(char){
            longest = max(longest, i-left)
            while array[left] != char{
                set.remove(array[left])
                left += 1
            }
            left += 1
        }else{
            set.insert(char)
        }
    }
    return max(longest, array.count - left)
}

print("number:",lengthOfLongestSubstring("pwwkew"))

