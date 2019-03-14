//
//  main.swift
//  Longest Common Prefix_14
//
//  Created by sz on 2019/3/5.
//  Copyright © 2019 Qin. All rights reserved.
//

import Foundation

    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0{
            return ""
        }else if strs.count == 1{
            return ""
        }
        var reslutstr = ""
        //采用基数排序的感觉
        for j in (0..<strs[0].count){ //j为第一个字符串的每一个字符
            var charresult  = Array(strs[0])
            let char = charresult[j]
            let end = strs.count
            print(end)
            for i in (1..<end){  //遍历的是其他字符串
                var compare = Array(strs[i])
                if j >= strs[i].count{
                    return reslutstr
                }else if compare[j] != char{
                     return reslutstr
                }
              
            }
            reslutstr = reslutstr + String(char)
        }
        return reslutstr
        
        
    }

var par : [String] =
    ["aa","a"]
print(longestCommonPrefix(par))
print("Hello, World!")

