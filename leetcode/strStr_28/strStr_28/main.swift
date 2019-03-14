//
//  main.swift
//  strStr_28
//
//  Created by 焕焕 on 2019/3/7.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    //此题属于字符串比对问题 kmp问题
    if needle.isEmpty{
        return 0
    }
    if needle.count > haystack.count{
        return -1
    }
    
    var hayarray = Array(haystack)
    var needlearray = Array(needle)
    var i = 0,j = 0
    while i < haystack.count && j < needle.count {
        if hayarray[i] == needlearray[j]{
            i += 1
            j += 1
        }else{
            i = i-j+1
            j = 0
        }
        
    }//while end
    if j>0{
        return i-needlearray.count
    }else{
        return -1
    }
    
}

func strStr1(_ haystack: String, _ needle: String) -> Int {
    //此题属于字符串比对问题 kmp问题
    //此题属于字符串比对问题 kmp问题
    if needle.isEmpty{
        return 0
    }
    if needle.count > haystack.count{
        return -1
    }
    
    for i in 0..<(haystack.count-needle.count+1){
        let index1 = haystack.index(haystack.startIndex, offsetBy: i)
        let index2 = haystack.index(haystack.startIndex, offsetBy: needle.count+i)
        let tmpStr = haystack[index1..<index2]
        if tmpStr == needle{
            return i
        }
    }
    return -1
    
}

let haystack = "a",needle = "a"

print("Hello, World:",strStr1(haystack, needle))

