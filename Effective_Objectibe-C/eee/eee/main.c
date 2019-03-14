//
//  main.c
//  eee
//
//  Created by sz on 2019/3/1.
//  Copyright © 2019 Qin. All rights reserved.
//

#include <stdio.h>
int reverse(int x) {
    
    if (x >2147483647 || x < -2147483648)
        return 0;
    else{
        int x1 = x;
        int array[10];
        for (int z=0; z<10; z++) {
            array[z]=-1;
        }
        
        int bian=1;
        for (int i = 0; x1 > 0; i++,x1/=10){
            array[i] = (x/bian)%10;
            bian =bian * 10;
        }
        
        
        int result =0;
        int j = 0;
        while(array[j]!= -1){
            bian = bian/10;
            result = result + array[j]*bian;
            j++;
        }
        return result;
    }
}

int reverse1(int x){

    int out = 0;
    while(x)
    {
        int temp = out*10 + x%10;
        if(((temp-x%10)/10)!= out)
        {
            return 0;
        }
        x = x/10;
        out = temp;
    }
    return out;
 
}
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    int sss= reverse(1000000009);
    int ddd = reverse1(1000000009 );
    printf("%d\n",sss);
     printf("%d\n",ddd);
    return 0;
}
