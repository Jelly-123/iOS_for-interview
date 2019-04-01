//
//  main.swift
//  17_Letter Combinations of a Phone Number
//
//  Created by 焕焕 on 2019/3/15.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation


    let letterArray: [Int: String] = [2:"abc",3:"def",4:"ghi",5:"gkl",6:"mno",7:"pqrs",8:"tuv",9:"wxyz"]
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return [""]        }
        let characters = Array(digits)
        var result = [String]()
        backtracing(characters, 0, &result,"")
        return result
    }
    //character 23  pos:0   result:结果  [ad][ae][af]之类的
    func backtracing(_ character :[Character],_ pos :Int,_ result :inout [String] ,_ string :String){
        if pos >= character.count {
   
            result.append(string)
            return
        }
        let str = letterArray[Int(String(character[pos]))!]
      
        for char in str! {
         
            backtracing(character, pos+1, &result,  string+String(char) )
        }
    }

 let input = "23"
print(letterCombinations(input))
