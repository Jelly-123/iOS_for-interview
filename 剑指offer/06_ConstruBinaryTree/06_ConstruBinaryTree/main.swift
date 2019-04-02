//
//  main.swift
//  06_ConstruBinaryTree
//
//  Created by 焕焕 on 2019/4/2.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation

class TreeNode{
    var val:Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val : Int) {
        self.val = val
        self.left = nil
        self.right = nil
        //需要将所有的初始化都完成
    }
}
//根据前中序列得到树
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

    if preorder == [] || inorder == [] {
        return nil
    }else{
        return buildTreeCore(0, 0, inorder.count-1, preorder, inorder)
    }
}
func buildTreeCore(_ startPreOrder:Int,_ startInOrder:Int,_ endInOrder:Int,_ preorder: [Int], _ inorder: [Int]) -> TreeNode! {
    if startPreOrder > preorder.count - 1 || startInOrder > endInOrder {
        return nil
    }
    let root : TreeNode = TreeNode(preorder[startPreOrder])
    
    //在中序遍历中找到根节点的位置
    var index = 0
    for i in startInOrder...endInOrder {
        if inorder[i] == root.val{
            index = i
            break
        }
    }
    
    //接下来递归调用
    root.left = buildTreeCore(startPreOrder + 1, startInOrder, index - 1, preorder, inorder)
    
    
    root.right = buildTreeCore(startPreOrder + (index - startInOrder) + 1, index+1, endInOrder, preorder, inorder)
    return root
}
//根据后中得到树
func buildTree_1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    if inorder == [] || postorder == []{
        return nil
    }else{
        return buildTreeCore_1(0,inorder.count - 1,postorder.count - 1,inorder,postorder)
    }
}
//第一个参数中序数组的开始，中序数组的结束，后序数组的结尾
func buildTreeCore_1(_ startInOrder : Int, _ endInOrder:Int, _ endPostOrder:Int,_ inorder: [Int], _ postorder: [Int]) -> TreeNode?{
    //有个截止条件，什么时候返回nil
    if startInOrder > endInOrder || endPostOrder < 0{
        return nil
    }
    let node = TreeNode(postorder[endPostOrder])
    var index = 0   //记录根节点在中序遍历的位置
    for i in startInOrder...endInOrder{
        if node.val == inorder[i]{
            index = i
            break
        }
        
    }
    let rightLength = endInOrder - index
    
    //递归左子树
    //第一个参数中序数组的开始，中序数组的结束，后序数组的结尾
    node.left = buildTreeCore_1(startInOrder,index - 1,endPostOrder - rightLength - 1,inorder,postorder)
    node.right = buildTreeCore_1(index + 1,endInOrder,endPostOrder - 1,inorder,postorder)
    return node
}

func start(){
    let preOrder = [9,3,15,20,7]
    let InOrder = [9,15,7,20,3]
    _ = buildTree_1(preOrder, InOrder)
 
}
start()



