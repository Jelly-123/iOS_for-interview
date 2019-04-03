/*
 按层次打印二叉树
 */
import Foundation

class TreeNode{
    var val :Int
    var left : TreeNode?
    var right : TreeNode?
    var parent : TreeNode?
    init(_ val:Int,_ left: TreeNode?,_ right:TreeNode?,_ parent:TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.parent = parent
    }
    
}
class Solution{
    func CengciOrder(_ root:TreeNode?){
        if root == nil {
            return
        }
        //定义一个队列
        var queue:[TreeNode] = []
        queue.append(root!)
        while !queue.isEmpty {
            let TmpNode = queue.removeFirst()
            print(TmpNode.val)
            if TmpNode.left != nil {
                queue.append((TmpNode.left)!)
            }
            if TmpNode.right != nil{
                queue.append((TmpNode.right)!)
            }
            
        }
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
    solution.CengciOrder(node_1)
}
testCase()
