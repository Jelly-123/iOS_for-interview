//
//  main.m
//  04_
//
//  Created by sz on 2019/1/28.
//  Copyright © 2019 Qin. All rights reserved.
//  替换空格

#import <Foundation/Foundation.h>

void replace(char *str){
    if (str == NULL) {
        NSLog(@"该字符串为空");
    }else{
        char *p,q;
        int count=0;
        unsigned long length = strlen(str);
        NSLog(@"length:%lu",length);
        for (int i=0; i<length; i++) {
            if (str[i]=='\0') {
                count++;
            }
        }
        NSLog(@"count:%d",count);
    }

   
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //使用oc语法替换
//        NSString * str = @"we are happy";
//        NSLog(@"%@",[str stringByReplacingOccurrencesOfString:@" " withString:@"%20"]);
        //使用普通c语言替换方法
        char str1[] ="we are happy";
        replace(str1);
    }
    return 0;
}



//char str[] = "Hello World";
//char str1[] ="Hello World";
//
//char * str2 = "Hello World";
//char * str3 = "Hello World";
//
//if (str == str1) {
//    NSLog(@"same");
//}else{
//    NSLog(@"not same"); //对
//}
//
//if (str2 == str3) {
//    NSLog(@"11same");   //对 这两个是指针，我们不用分配内存，hello world是字符串常量，它在内存中只有一个拷贝，所以他两指向的是一个地址
//}
//else{
//    NSLog(@"11not same");
//}
//
//NSString * str4 = @"hello world";
//NSString * str5 = @"hello world";
//if (str4 == str5) {
//    NSLog(@"22same");   //和2是一个道理
//}
//else{
//    NSLog(@"22not same");
//}
