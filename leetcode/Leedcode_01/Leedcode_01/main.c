//
//  main.c
//  Leedcode_01
//
//  Created by sz on 2019/2/25.
//  Copyright © 2019 Qin. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> //malloc
int* twoSum(int* nums, int numsSize, int target) {
    int i;
    int j;
    //1.static
//    static int array[2];
    //2.malloc
    int *array = NULL;
    for(i=0;i<(numsSize-1);i++)
        for(j=i+1;j<numsSize;j++){
            if(nums[i]+nums[j]==target){
                array = (int*)malloc(sizeof(int) * 2);
                array[0]=i;
                array[1]=j;
                return array;
            }
        }
    return array;
}
int removeDuplicates(int A[], int n) {
    if(n < 2) return n;
    int id = 1;
    for(int i = 1; i < n; ++i)
        if(A[i] != A[i-1])
            A[id++] = A[i];
    return id;
}
int main(int argc, const char * argv[]) {
    // insert code here...

    int nums[4] = {2,7,11,15};
    int target = 9;
    int * result = twoSum(nums, 4, target);

    printf("twoSum:%d，%d",result[0],result[1]);

    int numss[3] = {1,1,2};
    printf("%d",removeDuplicates(numss, 3));
   
    return 0;
}


/* tip:
    返回值若为指针，则需注意会出现这个错误。如果返回的指针地址指向函数内的局部变量，在函数退出时，该变量的存储空间会被销毁，此时去访问该地址就会出现这个错误。
 
 */
