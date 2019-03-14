//
//  main.swift
//  Add Two Numbers_2
//
//  Created by 焕焕 on 2019/3/8.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var p1  = l1
    var p2  = l2
    var result = ListNode.init(0)
    var head = result
    var carry  = 0
    var sum = 0
    //如果存在进位的情况
    while p1 != nil || p2 != nil || carry != 0{
        sum = carry
        if p1 != nil{
            sum += p1!.val
            p1 = p1?.next
        }//end if
        if p2 != nil{
            sum += p2!.val
            p2 = p2?.next
        }
        sum = sum % 10
        carry = sum / 10
        let Node = ListNode(sum)
        head.next = Node
        head = head.next!
        
    }//while end
    
    return result.next
    
    
}

