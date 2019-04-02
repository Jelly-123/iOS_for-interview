//
//  main.swift
//  18_SubstructureInTree
//
//  Created by 焕焕 on 2019/4/2.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

class TreeNode : Equatable{
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
    var left : TreeNode?
    var right : TreeNode?
    var parent : TreeNode?
    var val : Int
    init(value: Int,left: TreeNode?,right:TreeNode?,parent:TreeNode?) {
        self.val = value
        self.left = left
        self.right = right
        self.parent = parent
    }
}
class Solution{
    /*
     判断树B是否为树A的子树
     - parameters:
     -rootA:树a
     -rootB:树b
     - returns:树b是否为树a的子树
     */
    func HasSubTree(_ rootA:TreeNode?,_ rootB:TreeNode?) -> Bool {
        var result = false
        if rootA != nil && rootB != nil{
            if rootA == rootB {
                result = DoesTreeAHaveTreeB(rootA, rootB)//继续比较
            }
            if !result {
                result = HasSubTree(rootA?.left,rootB)
            }
            if !result {
                result = HasSubTree(rootA?.right,rootB)
            }
        }
        return result
    }
    /**
     判断树1是否包含树2(包括树2为空)
     - Parameters:
     - root1: 树1
     - root2: 树2
     - Returns: 是否包含
     */
    func DoesTreeAHaveTreeB(_ rootA:TreeNode?,_ rootB:TreeNode?) -> Bool {
        if rootB == nil {
            return true
        }
        if rootA == nil {
            return false
        }
        if rootA! != rootB! {
            return false
        }
        return DoesTreeAHaveTreeB(rootA?.left,rootB?.left) && DoesTreeAHaveTreeB(rootA?.right,rootB?.right)
    }
    
}

    // 树中结点含有分叉，树B是树A的子结构
    //                8          8
    //              /   \       / \
    //             8     7     9   2
    //           /   \
    //          9     2
    //               / \
    //              4   7
func testCase1(){
    let node_1 = TreeNode(value: 8, left: nil, right: nil, parent: nil)
    let node_2 = TreeNode(value: 8, left: nil, right: nil, parent: node_1)
    let node_3 = TreeNode(value: 7, left: nil, right: nil, parent: node_1)
    let node_4 = TreeNode(value: 9, left: nil, right: nil, parent: node_2)
    let node_5 = TreeNode(value: 2, left: nil, right: nil, parent: node_2)
    let node_6 = TreeNode(value: 4, left: nil, right: nil, parent: node_5)
    let node_7 = TreeNode(value: 7, left: nil, right: nil, parent: node_5)
    node_1.left = node_2
    node_1.right = node_3
    node_2.left = node_4
    node_2.right = node_5
    node_5.left = node_6
    node_5.right = node_7
    
    let node_8 = TreeNode(value: 8, left: nil, right: nil, parent: nil)
    let node_9 = TreeNode(value: 9, left: nil, right: nil, parent: node_8)
    let node_10 = TreeNode(value: 2, left: nil, right: nil, parent: node_8)
    node_8.left = node_9
    node_8.right = node_10
    let solution = Solution()
    print(solution.HasSubTree(node_1, node_8))

        
        
}
testCase1()


