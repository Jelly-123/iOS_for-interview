//
//  UserInfoManager.h
//  02_Sington
//
//  Created by 焕焕 on 2019/3/18.
//  Copyright © 2019 焕焕. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoManager : UIView

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSNumber *age;

+(instancetype)managerCenter;

@end

NS_ASSUME_NONNULL_END
