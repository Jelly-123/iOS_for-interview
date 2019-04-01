//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Mr.LuDashi on 16/10/26.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import Foundation

class BinaryTreeNote {
    var data: Int
    var leftChild: BinaryTreeNote!    //左节点指针
    var rightChild: BinaryTreeNote!   //右节点指针
    
    init(data: Int) {
        self.data = data
    }
    
    deinit {
        print("\(self.data)释放")
    }
}


/// 存储二叉排序树查找的结果
class SearchResult {
    //存储查找的节点，如果查找成功就是当前查找成功的节点
    var searchNote: BinaryTreeNote?
    
    //存储当前查找节点的直属父节点
    var fatherNote: BinaryTreeNote?
    
    //查找成功为true，查找失败为false
    var isFound: Bool = false
}

class BinarySearchTree {
    var rootNote: BinaryTreeNote?
    
    fileprivate var items: Array<Int>
    fileprivate var index = -1
    
    init(items: Array<Int>) {
        self.items = items
        createBinarySearchTree()
    }
    
    /// 根据提供的数据创建二叉排序树
    func createBinarySearchTree() {
        for key in items {
            //对key进行查找
            let searchResult = searchBST(currentRoot: rootNote, faterNote: nil, key: key)
            
            //如果查找失败，则插入到二叉排序树上
            if !searchResult.isFound {
                insertNote(faterNote: searchResult.fatherNote, key: key)
            }
        }
        inOrderTraverse()
    }
    
    /// 查找二叉排序树
    ///
    /// - parameter currentRoot: 当前二叉排序树的根节点或者子树的根节点
    /// - parameter faterNote: 该根节点的父节点，如果是整个二叉排序树的根节点的话就为nil
    /// - parameter key: 查找的关键字
    ///
    /// - returns:返回查找的结果对象
    func searchBST(currentRoot: BinaryTreeNote?,
                   faterNote: BinaryTreeNote?, key: Int) -> SearchResult {
        let searchResult = SearchResult()
        
        //查找失败, 返回该节点的父类节点，第一次会跳转到这一步
        if currentRoot == nil {
            searchResult.fatherNote = faterNote
            searchResult.isFound = false
            return searchResult
        }
        
        //查找成功，返回查找成功的节点，然后将isFound设置成true
        if key == currentRoot?.data {
            searchResult.searchNote = currentRoot
            searchResult.fatherNote = faterNote
            searchResult.isFound = true
            return searchResult
        }
        
        if key < (currentRoot?.data)! {
            return searchBST(currentRoot: currentRoot?.leftChild,   //递归左子树
                faterNote: currentRoot,
                key: key)
        } else {
            return searchBST(currentRoot: currentRoot?.rightChild,  //递归右子树
                faterNote: currentRoot,
                key: key)
        }
    }
    
    /// 往二叉排序树上插入节点
    ///
    /// - parameter faterNote: 插入节点的父节点
    /// - parameter key: 插入的数据
    func insertNote(faterNote: BinaryTreeNote?, key: Int) {
        let note = BinaryTreeNote(data: key)
        if faterNote == nil { //创建根节点
            rootNote = note
            return
        }
        
        if key < (faterNote?.data)! {
            faterNote?.leftChild = note
        } else {
            faterNote?.rightChild = note
        }
    }
    func delete(key :Int){
        print("要删除的节点为:\(key)")
        let result = searchBST(currentRoot: rootNote, faterNote: nil, key: key)
        deleteNode(searchResult: result)
        
    
    }

    
    /**
     中序遍历
     */
    func inOrderTraverse() {
        print("中序遍历：")
        self.inOrderTraverse(note: rootNote)
        print("\n")
    }
    
    private func deleteNode(searchResult:SearchResult){
        guard let searchNode = searchResult.searchNote else{
            print("没有要删除的值")
            return
        }
        //叶子结点
        if searchNode.leftChild == nil && searchNode.rightChild == nil {
            print("该节点为叶子结点，只需要删除它的左右孩子")
            deleteNodeHaveZeroOrOneChild(searchResult: searchResult, subNode:nil)
        }
        //只有左子树
        if searchNode.leftChild != nil && searchNode.rightChild == nil{
            print("该节点只有左孩子")
            deleteNodeHaveZeroOrOneChild(searchResult: searchResult, subNode: searchNode.leftChild)
            return
        }
        //只有右子树
        if searchNode.leftChild == nil && searchNode.rightChild != nil{
            print("只有右子树")
            deleteNodeHaveZeroOrOneChild(searchResult: searchResult, subNode: searchNode.rightChild)
            return
        }
        //左右子树都有
        //1.先找到右子树里面最小的，然后赋给根节点
        //2.再删去右子树里面最小的
        if searchNode.leftChild != nil && searchNode.rightChild != nil{
            print("该节点既有左子树还有右子树")
            deleteHaveTwoChild(searchResult: searchResult)
            return
        }
    }
    func deleteNodeHaveZeroOrOneChild(searchResult:SearchResult,subNode:BinaryTreeNote?){
        
        setNilForNote(note: searchResult.searchNote!)
        //如果为true则跳过
        guard let fatherNode = searchResult.fatherNote  else {
            //如果只有一个节点，则更新根节点
            self.rootNote = subNode
            return
        }
        //有父节点
        if (searchResult.searchNote?.data)! < fatherNode.data  {
            fatherNode.leftChild = subNode
        }else{
            fatherNode.rightChild = subNode
        }
        
    }
    private func deleteHaveTwoChild(searchResult :SearchResult){
       //初始化查询结果，用于存储右子树上的最小节点
        let cursorSearchResult = SearchResult()
        cursorSearchResult.searchNote = searchResult.searchNote?.rightChild
        cursorSearchResult.fatherNote = searchResult.searchNote
      
        //寻找删除节点右子树最左边的节点
        while cursorSearchResult.searchNote?.leftChild != nil {
            cursorSearchResult.fatherNote = cursorSearchResult.searchNote
            cursorSearchResult.searchNote = cursorSearchResult.searchNote?.leftChild
        }
        //将右子树的最左边的节点值赋给要删除的点
//        self.rootNote = cursorSearchResult.searchNote  不一定是根节点
        searchResult.searchNote?.data = (cursorSearchResult.searchNote?.data)!
        //删除右子树的最左节点
        deleteNodeHaveZeroOrOneChild(searchResult: cursorSearchResult, subNode: nil)
        
    }

    
    /// 将节点的左右子节点指针置为空
    ///
    /// - parameter note: <#note description#>
    private func setNilForNote(note: BinaryTreeNote) {
        note.leftChild = nil
        note.rightChild = nil
    }
    
    /// 中序遍历二叉排序树
    ///
    /// - parameter note:
    private func inOrderTraverse (note: BinaryTreeNote!) {
        guard let note = note else {
            return
        }
        inOrderTraverse(note: note.leftChild)
        print(note.data, separator: " ", terminator: " ")
        inOrderTraverse(note: note.rightChild)
    }
    
    
}
