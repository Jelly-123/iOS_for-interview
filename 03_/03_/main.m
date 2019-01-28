//
//  main.m
//  03_
//
//  Created by sz on 2019/1/28.
//  Copyright © 2019 Qin. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
    函数Find是寻找在行与列都递增的矩阵中是否存在这个数。
    可从矩阵的右上方或左下方寻找
 */
BOOL Find(int *matrix,int target,int cols,int rows){
    //从右上方开始查找
    BOOL found = false;
    if (matrix!= NULL &&rows>0 && cols >0) {
        //特殊测试用例
        int row = 0;
        int col = cols - 1;
        while (row < rows && col >0) {
            if (matrix[row*cols+col]==target) {
                found = true;
                break;
                
            }else if(matrix[row*cols+col]>target){
                col--;
            }else{
                row++;
            }
        }
    }else{
        NSLog(@"特殊测试用例");
    }
    return found;
}
BOOL Find1(int matrix[][4],int target,int cols,int rows){
    //从左下方开始查找
    BOOL found = false;
    if (matrix!= NULL &&rows>0 && cols >0) {
        //特殊测试用例
        int row = rows - 1;;
        int col = 0;
        while (row>0 && col <cols) {
            if (matrix[row][col]==target) {
                found = true;
                break;
                
            }else if(matrix[row][col]>target){
                row--;
            }else{
                col++;
            }
        }
    }else{
        NSLog(@"特殊测试用例");
    }
    return found;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[][4] = {{1,2,8,9},{2,4,9,12},{4,7,10,13},{6,8,11,15}};
        NSLog(@"数是否存在在该矩阵中:%d",Find(a,7,4,4));
        NSLog(@"数是否存在在该矩阵中:%d",Find1(a,7,4,4));
    }
    return 0;
}
