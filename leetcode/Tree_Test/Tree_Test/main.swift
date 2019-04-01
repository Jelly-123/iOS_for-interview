//
//  main.swift
//  Tree_Test
//
//  Created by 焕焕 on 2019/3/24.
//  Copyright © 2019 焕焕. All rights reserved.
//  二叉排序树的查找、删除、与插入

import Foundation

let searchTable : Array<Int> =  [62, 88, 58, 47, 62, 35, 73, 51, 99, 37, 93]
let binarySearchTree = BinarySearchTree(items: searchTable)

binarySearchTree.delete(key: 62)
binarySearchTree.inOrderTraverse()
