/*
 题目描述：
    输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历，是则返回true，否则返回false。假设输入的数组的任意两个数字都互不相同
 解题思路：
    二叉搜索树的左孩子都比根节点小，右孩子都比根节点大。故根据后续遍历可以得到根节点，以此类推
*/
import Foundation

//testCase()
class Solution_1{
    func VeritySquenceOfBST(_ input:[Int]) -> Bool {
        if input.count == 0 {
            return true
        }
        //取出根节点
        let root = input.last!
        //遍历除过根节点的前面所有节点，找个比这个根节点的小的，分成两拨数组，一拨是根节点的左孩子，一拨是根节点的右孩子
        var i = 0
        while i < input.count - 1{
            if input[i] > root{
                break
            }
            i = i + 1
        }
        var j = i
        
        //检查右子树，检查异常情况
        while j < input.count - 1 {
            if input[j] < root{
                return false
            }
            j = j + 1
        }
        //递归继续
        var left : Bool = true
        if i > 0 {
            left = VeritySquenceOfBST(Array(input[0..<i]))
        }
        var right : Bool = true
        if i < input.count - 1 {
            right = VeritySquenceOfBST(Array(input[i..<(input.count - 1)]))
        }
        return left && right
    }
}

func testCase_1(){
    let input:[Int] = [5,7,6,9,11,10,8]
    let solution = Solution_1()
    let result = solution.VeritySquenceOfBST(input)
    print(result)
}
testCase_1()
