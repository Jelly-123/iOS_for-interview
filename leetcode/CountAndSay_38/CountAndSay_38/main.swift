//
//  main.swift
//  CountAndSay_38
//
//  Created by 焕焕 on 2019/3/8.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

func countAndSay(_ n: Int) -> String {
    if n < 1{
        return ""
    }
    if n == 1 {
        return "1"
    }
    var result : String = ""
    if n > 1 {
        let resultString = countAndSay(n-1) + "*"
        var tmpArray = Array(resultString)
        var count :Int = 1

        //大于两个字符的时候
        for i in 1..<tmpArray.count{
            
            
                if tmpArray[i] == tmpArray[i-1]{//两个相等
                    count += 1
                }else{
                    
                    result.append(String(count))
                    result.append(String(tmpArray[i-1]))
                    count = 1
                }

        }//end for
    
    }
    return result
}
print(countAndSay(4))
