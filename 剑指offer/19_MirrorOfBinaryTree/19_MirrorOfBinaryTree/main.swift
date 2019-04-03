//
//  main.swift
//  19_MirrorOfBinaryTree
//
//  Created by 焕焕 on 2019/4/3.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

class TreeNode{
    var val: Int
    var left:TreeNode?
    var right:TreeNode?
    var parent:TreeNode?
    
    init(_ val : Int,_ left:TreeNode?,_ right:TreeNode?,_ parent: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.parent = parent
    }
}
class Solution{
    /**
     
     */
    func MirrorOfBinaryTree(_ root:TreeNode?){
        if root == nil {
            return
        }
        if root?.left == nil && root?.right == nil {
            return
        }   //必须是非叶子结点。否则叶子结点的左右孩子为w空，则会导致不能赋值给TmpNode
        var TmpNode :TreeNode
        TmpNode = root!.right!
        root?.right = root?.left
        root?.left = TmpNode
        
        MirrorOfBinaryTree(root?.left)
        MirrorOfBinaryTree(root?.right)
    }
    //再写一个前序遍历，方便查看
    func preOrder(_ root:TreeNode?){
        if root == nil {
            return
        }
        print((root?.val)!,separator: " ")
        preOrder(root?.left)
        preOrder(root?.right)
    }
}

func testCase(){
    let node_1 = TreeNode(8, nil, nil, nil)
    let node_2 = TreeNode(6, nil, nil, node_1)
    let node_3 = TreeNode(10, nil, nil, node_1)
    let node_4 = TreeNode(5, nil, nil, node_2)
    let node_5 = TreeNode(7, nil, nil, node_2)
    let node_6 = TreeNode(9, nil, nil, node_3)
    let node_7 = TreeNode(11, nil, nil, node_3)
    node_1.left = node_2
    node_1.right = node_3
    node_2.left = node_4
    node_2.right = node_5
    node_3.left = node_6
    node_3.right = node_7
    let solution = Solution()
    solution.preOrder(node_1)
    print("镜像后:")
    solution.MirrorOfBinaryTree(node_1)
    solution.preOrder(node_1)
}

