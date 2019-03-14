//
//  DKObject+Category.m
//  Equaility
//
//  Created by sz on 2019/2/28.
//  Copyright © 2019 Qin. All rights reserved.
//

#import "DKObject+Category.h"
#import <objc/runtime.h>
/*使用
    objc_getAssociatedObject和objc_setAssociatedObject模拟“属性”的存取方法，使用关联对象模拟实例变量
 @selector(categoryProperty)是key值
 OBJC_ASSOCIATION_RETAIN_NONATOMIC代表：nonatomic,strong
 */
@implementation DKObject (Category)

- (NSString *)categoryProperty {
    return objc_getAssociatedObject(self, _cmd);
    //_cmd是选择子，@selector(categoryProperty)
}

- (void)setCategoryProperty:(NSString *)categoryProperty {
    objc_setAssociatedObject(self, @selector(categoryProperty), categoryProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
