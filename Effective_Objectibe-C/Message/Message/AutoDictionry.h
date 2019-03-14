//
//  AutoDictionry.h
//  Message
//
//  Created by sz on 2019/3/3.
//  Copyright © 2019 Qin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoDictionry : NSObject
@property(nonatomic,strong)NSString * string;
@property(nonatomic,strong)NSNumber * number;
@property(nonatomic,strong)NSDate * date;
@property(nonatomic,strong)id opaqueObject;
@end

NS_ASSUME_NONNULL_END
