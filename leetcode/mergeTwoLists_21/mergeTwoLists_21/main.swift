//
//  main.swift
//  mergeTwoLists_21
//
//  Created by 焕焕 on 2019/3/6.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode? //可选类型。因为链表中最后一个节点不会指向其他节点了
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    //注意临界条件
    if l1 == nil{
        return l2
    }
    if l2 == nil {
        return l1
    }
    if l1 == nil && l2 == nil{
        return nil
    }
    
    var p1 = l1
    var p2 = l2
    let result = ListNode(0)
    var tmp = result
    

    while (p1 != nil) && (p2 != nil){
        if p1!.val >= p2!.val{
            tmp.next = p2
            p2 = p2!.next
            tmp = tmp.next!
        }else{
            tmp.next = p1
            p1 = p1!.next
             tmp = tmp.next!
        }
    }//while end
    if p1 == nil{
        //将长的放置在结果中
        tmp.next = p2
    }//if end
    if p2 == nil{
        //将长的放置在结果中
        tmp.next = p1
    }//if end
    return result.next
}

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.filter {$0 != val}
    return nums.count
}
let prices = [20,30,40]
let result = prices.filter{ $0 > 25 }
print(result)


func removeDuplicates(_ nums: inout [Int]) -> Int {
    var pre = 0
    var i = 1
    while nums[i] != -1{
        if nums[pre] == nums[i]{
            nums.remove(at: i)
        }else{
            pre = i
            i += 1
        }// if end
        if nums.count == i{
            break
        }
       
    }//end for
    print(nums)
    return nums.count
}
var nums = [0,0,1,1,1,2,2,3,3,4]
print("nums:",removeDuplicates(&nums))


//ok
func removeDuplicates1(_ nums: inout [Int]) -> Int {
    if nums.count<2{
        return 1
    }
    var id = 1
    for i in (1..<nums.count){
        if nums[i] != nums[i-1]{
            nums[id] = nums[i]
            id += 1
        }
    }
    return id
}
var numss = [1,1,2]
print("numss:",removeDuplicates1(&numss))
