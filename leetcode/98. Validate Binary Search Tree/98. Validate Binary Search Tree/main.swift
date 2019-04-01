//
//  main.swift
//  98. Validate Binary Search Tree
//
//  Created by 焕焕 on 2019/3/23.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation
public class TreeNode {
       public var val: Int
     public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
            self.val = val
                self.left = nil
               self.right = nil
        }
 }
func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil{
            return true
        }
        else{
            return checkBTS(root,Int.min,Int.max)
        }
        
}
func checkBTS(_ root: TreeNode?,_ min: Int,_ max :Int) -> Bool{
    if root == nil {
        return true
    }
    
    if minNode != nil && root!.val <= minNode!.val {
        return false
    }
    if maxNode != nil && root!.val >= maxNode!.val {
        return false
    }
    
    return helper(root?.left, minNode, root) && helper(root?.right, root, maxNode)
}

