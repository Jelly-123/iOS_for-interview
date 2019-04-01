//
//  UserInfoManager.m
//  02_Sington
//
//  Created by 焕焕 on 2019/3/18.
//  Copyright © 2019 焕焕. All rights reserved.
//

#import "UserInfoManager.h"
 static UserInfoManager * centre = nil;
@implementation UserInfoManager
- (instancetype)init{
    NSString * string = (NSString *)centre;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfoManager"]) {
        self = [super init];
        if (self) {
            NSString * classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"UserInfoManager"] == NO) {
                NSParameterAssert(nil);
            }
        }
        return self;
    }else{
        return  nil;
    }
}
//+ (void)initialize{
//    static UserInfoManager * centre = nil;
//    if (self == [UserInfoManager class]){
//        centre = [[UserInfoManager alloc]init];
//    }
//}

//+(instancetype)managerCenter{
//    static UserInfoManager * centre = nil;
//    if(centre == nil){
//        centre = [[UserInfoManager alloc]init];
//    }
//    return centre;
//}
+(instancetype)managerCenter{
   

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        centre = (UserInfoManager *)@"UserInfoManager";
        centre = [[UserInfoManager alloc]init];
    });
    //防止子类使用
    NSString * classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"UserInfoManager"] == NO) {
        NSParameterAssert(nil);
    }
    return centre;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
