//
//  AVL.swift
//  AVL
//
//  Created by 焕焕 on 2019/3/24.
//  Copyright © 2019 焕焕. All rights reserved.
//

import Foundation
///构建平衡二叉树的数据结构
class AVLTreeNode{
    var depth : Int{
        get {
            if leftChild != nil && rightChild != nil {
                //如果一个节点的左右孩子b都不为空，则取最大的+1
                if leftChild.depth > rightChild.depth{
                    return leftChild.depth + 1
                }else{
                    return rightChild.depth + 1
                }
            }
            if leftChild != nil{
                return leftChild.depth + 1
            }
            if rightChild != nil{
                return rightChild.depth + 1
            }
            return 0
        }
    }
    var balanceFactor :Int{
        get{
            if leftChild != nil && rightChild != nil{
                return leftChild.depth - rightChild.depth
            }
            if leftChild != nil {
                return leftChild.depth+1
            }
            if rightChild != nil {
                return -(rightChild.depth + 1)
            }
            return 0
        }
    }
    var data : Int
    var fatherNode :AVLTreeNode?
    var leftChild :AVLTreeNode!
    var rightChild: AVLTreeNode!
    
    init(data : Int) {
        self.data = data
    }
    deinit {
        print("\(self.data)被释放掉")
    }
}
///存储二叉排序树的结果
class SearchResult{
    var searchNode : AVLTreeNode?   //  ?有可能没查到，为空
    var fatherNode : AVLTreeNode?
    var isFound = false
}//查找的结果状态

class AVLTree{
    //根节点
    var rootNode :AVLTreeNode?
    var item :Array<Int>
    init(item:Array<Int>) {
        self.item = item
        creatBinaryTree()
    }
    //创建平衡二叉树
    func creatBinaryTree(){
        for key in item {
            //先查找，如果找不到，则插入
            let searchResult = searchNode(currentNode: rootNode, fatherNode: nil, key: key)
            
            if searchResult.isFound == false{
                //如果没有找到，则需要插入
                insertNode(fatherNode: searchResult.fatherNode, key: key)
            }
            
        }
        //中序遍历一遍
        inOrderTraverse(root: rootNode)
    }
    ///查找节点是否存在
    func searchNode(currentNode : AVLTreeNode?,fatherNode:AVLTreeNode?,key :Int) -> SearchResult {
        let searchResult = SearchResult()
        //如果当前节点为空，则返回父亲节点
        if currentNode == nil{
            searchResult.fatherNode = fatherNode
            searchResult.isFound = false
            return searchResult
        }
        //如果找到了，则返回该节点
        if currentNode?.data == key{
            //如果当前的节点为要找的key值，则返回该节点
            searchResult.searchNode = currentNode
            searchResult.fatherNode = fatherNode
            searchResult.isFound = true
            return searchResult
        }
        if (currentNode?.data)!  > key{
            //需要在右边部分找
            return searchNode(currentNode: currentNode?.leftChild, fatherNode: currentNode, key: key)
        }else{
            //需要在左边部分找
            return searchNode(currentNode: currentNode?.rightChild, fatherNode: currentNode, key: key)
        }
    }
    ///插入节点，需要传父亲节点，key
    func insertNode(fatherNode : AVLTreeNode?,key: Int){
        //需要在最开始创建一个节点,告诉它的爸爸是谁
        let insertNode = AVLTreeNode(data: key)
        insertNode.fatherNode = fatherNode
        
        if fatherNode == nil {
            //如果父亲节点为nil，则是一个空树，需要赋值根节点
            rootNode = insertNode
            return
        }
        if (fatherNode?.data)! > key {
            //需要将key插入到父亲节点的左边
            fatherNode?.leftChild = insertNode
//            return
        }else{
            //插入到父亲节点的右边
            fatherNode?.rightChild = insertNode
//            return
        }
        findnoBalanceNode(currentNode: insertNode)
    }
    ///删除节点，并要保证该节点删除之后该树平衡
    func deleteKey(data: Int){
        //先找节点
        print("我们马上要删除data节点了")
        let searchResult = searchNode(currentNode: rootNode, fatherNode: nil, key: data)
        if searchResult.isFound == false {
            print("未找到该节点")
            return
        }else{
            deleteNode(searchResult: searchResult)
            
        }
        
    }
    //参数为要删除节点的父节点
    func deleteNode(searchResult : SearchResult!){
        //分四种情况 1.叶子结点 2.删除的节点有左子树 3.删除的节点有右子树 4.删除的节点有左有右
        if searchResult.fatherNode == nil{
            //只有一个根节点
            rootNode = nil
            return
        }
        //只有父节点
        if searchResult.searchNode!.leftChild == nil && searchResult.searchNode!.rightChild == nil{
            print("该节点为叶子结点 ")
            if (searchResult.searchNode?.data)! > (searchResult.fatherNode?.data)!{
                searchResult.fatherNode?.rightChild = nil
                return
            }else{
                searchResult.fatherNode?.leftChild = nil
                return
            }
            
            
            
        }
        //删除的节点有一个左孩子/右孩子
        if searchResult.searchNode?.leftChild == nil || searchResult.searchNode?.rightChild == nil {
            print("要删除的该节点有一个左孩子或右孩子")
            if searchResult.searchNode?.leftChild != nil{
                searchResult.fatherNode?.leftChild = searchResult.searchNode?.leftChild
                return
            }else{
                searchResult.fatherNode?.rightChild = searchResult.searchNode?.rightChild
                return
            }
        }
        
        //删除的节点既有左孩子又有右孩子
        if searchResult.searchNode?.leftChild != nil && searchResult.searchNode?.rightChild != nil{
            print("要删除的节点既有左孩子，又有右孩子")
            //弄一个临时变量 ,用于存储右子树上的最小节点
            let cursor = SearchResult()
            cursor.searchNode = searchResult.searchNode?.rightChild
            cursor.fatherNode = searchResult.searchNode
            
            //这里的策略是找到右边最小的，然后覆盖要删除的这个节点，然后删除右边最小的这个节点
            while cursor.searchNode?.leftChild != nil{
                cursor.fatherNode = cursor.searchNode
                cursor.searchNode = cursor.searchNode?.leftChild    //右子树的最左边
            }
            //cursor就是找到的右边最小的那个节点2.覆盖
            searchResult.searchNode?.data = (cursor.searchNode?.data)!
            //最后删除
            cursor.fatherNode?.leftChild = nil
    
            
            
        }

    }
    ///寻找不平衡点
    func findnoBalanceNode(currentNode :AVLTreeNode){
        var cursor = currentNode.fatherNode
        while cursor != nil {
            let balanceFactor = (cursor?.balanceFactor)!
            if balanceFactor < -1 || balanceFactor > 1{
                print("不平衡点为：值为\(cursor?.data),深度为\(cursor?.depth)，平衡因子为\(cursor?.balanceFactor)")
                //调整
                adjustBalance(noBalance: cursor!)
                return
            }
            cursor = cursor?.fatherNode
            
        }
        
    }
    enum NoBalanceType {
        case LL
        case LR
        case RR
        case RL
    }
    func adjustBalance(noBalance : AVLTreeNode){
        guard let noBalanceType = fixNoBalanceType(nobalanceNode: noBalance) else {
            return
        }
        switch noBalanceType {
        case .LL:
            LLAdjust(noBalanceNode: noBalance)
        case .LR:
            LRAdjust(noBanlanceNode: noBalance)
        case .RL:
            RLAdjust(noBalanceNode: noBalance)
        default:
            RRAdjust(noBalanceNode: noBalance)
        }
    }
    ///确定不平衡的类型,这里有可能为空
    func fixNoBalanceType(nobalanceNode:AVLTreeNode) ->NoBalanceType?{
        let noBalanceFactor = nobalanceNode.balanceFactor
        if noBalanceFactor == 2 {
            //ll或LR类型
            let nobalanceleftfactor = nobalanceNode.leftChild.balanceFactor
            if nobalanceleftfactor == 1{
                return NoBalanceType.LL
            }
            if nobalanceleftfactor == -1{
                return NoBalanceType.LR
            }
            //有一个删除节点时的东西
        }
        
        if noBalanceFactor == -2 {
            //rr或rl类型
            let noBalanceRight = nobalanceNode.rightChild.balanceFactor
            if noBalanceRight == 1{
                return NoBalanceType.RL
            }
            if noBalanceRight == -1{
                return NoBalanceType.RR
            }
            //同理
        }
        return nil
    }


    ///中序遍历
    func inOrderTraverse(root:AVLTreeNode!){
        guard let node = root else {
            return
        }
 
        inOrderTraverse(root: node.leftChild)
        print(root.data,separator: " ",terminator: "  ")
        
        inOrderTraverse(root: node.rightChild)
    }
    ///调整左左情况导致的不平衡,noBalanceNode为不平衡的点
    func LLAdjust(noBalanceNode:AVLTreeNode) {
        //定义一个currrntLeft,将来会成为最上面的那个
        let currentLftChild = noBalanceNode.leftChild
        noBalanceNode.leftChild = currentLftChild?.rightChild
        currentLftChild?.rightChild = noBalanceNode
        //获取要调整节点的父节点
        guard let father = noBalanceNode.fatherNode else{
            //如果上述不满足，即此时noBalanceNode.fatherNode为nil,则需要重新调整父节点,使当前的currentLftChild为根节点
            rootNode = currentLftChild
            noBalanceNode.fatherNode = currentLftChild //不平衡的d他爸为currentLftChild
            currentLftChild?.fatherNode = nil   //根的父节点为nil
            return
        }
        //当目前不平衡的点不为根节点时
        if (currentLftChild?.data)! > father.data{
//            调整过后若目前这个节点大于父节点的值，则放在父节点的右孩子上.不过我感觉，它是在左边的左边插入的。应该会会成为他的左孩子 后面的加以验证
            father.rightChild = currentLftChild
        }else{
            father.leftChild = currentLftChild
        }
        //更新父节点
        noBalanceNode.fatherNode = currentLftChild
        currentLftChild?.fatherNode = father
    }
    ///右右调整
    func RRAdjust(noBalanceNode:AVLTreeNode){
        let currentRightChild  = noBalanceNode.rightChild
        noBalanceNode.rightChild = currentRightChild?.leftChild
        currentRightChild?.leftChild = noBalanceNode
        
        //若不平衡点为根节点
        guard let father = noBalanceNode.fatherNode else{
            //此时不平衡的点为根节点
            rootNode = currentRightChild
            noBalanceNode.fatherNode = currentRightChild
            currentRightChild?.fatherNode = nil
            return
        }
        //忘了很重要的一步。只定义了往上走，那现在平衡的这个节点是父亲节点的左孩子还是右孩子呢
        if father.data > (currentRightChild?.data)!{
            father.leftChild = currentRightChild
        }else{
            father.rightChild = currentRightChild
        }
        //此时不为根节点,更新两个父节点
        currentRightChild?.fatherNode = father
        noBalanceNode.fatherNode = currentRightChild
    }
    ///调整左右
    func LRAdjust(noBanlanceNode:AVLTreeNode){
        print("要进行左右调整了")
        let currentleft = noBanlanceNode.leftChild.rightChild
        let fatherNode = noBanlanceNode.leftChild
        fatherNode?.rightChild = currentleft?.leftChild
        currentleft?.leftChild = fatherNode
        noBanlanceNode.leftChild = currentleft
        //更新父节点
        currentleft?.fatherNode = noBanlanceNode
        LLAdjust(noBalanceNode: noBanlanceNode)
        
    }
    ///右左情况造成的失衡
    func RLAdjust(noBalanceNode : AVLTreeNode){
        print("右左情况造成的失衡")
        let currentRight = noBalanceNode.rightChild.leftChild
        let fatherNode = noBalanceNode.rightChild
        fatherNode?.leftChild = currentRight?.rightChild
        currentRight?.rightChild = fatherNode
        noBalanceNode.rightChild = currentRight
        //更新父节点
        currentRight?.fatherNode = noBalanceNode
        RRAdjust(noBalanceNode: noBalanceNode)
    }
    
}
