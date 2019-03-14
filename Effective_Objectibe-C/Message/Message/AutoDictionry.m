//
//  AutoDictionry.m
//  Message
//
//  Created by sz on 2019/3/3.
//  Copyright © 2019 Qin. All rights reserved.
//

#import "AutoDictionry.h"
#import <objc/runtime.h>
@interface AutoDictionry()
@property (nonatomic,strong)NSMutableDictionary * backingStore;
@end
@implementation AutoDictionry
@dynamic string,date,number,opaqueObject;
-(id)init{
    if (self = [super init]) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSString * selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionrySetter, "v@:@");
    }else{
        class_addMethod(self, sel, (IMP)autoDictionryGetter, "@@:");
    }
    return YES;
}
void autoDictionrySetter(id self ,SEL _cmd ,id value){
    AutoDictionry * typeSelf = (AutoDictionry *)self;
    NSMutableDictionary * backingStore = typeSelf.backingStore;
    
    NSString * selectorString = NSStringFromSelector(_cmd);
    NSMutableString * key =[selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length -1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    NSString * lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    if (value) {
        [backingStore setObject:value forKey:key];
    }else{
        [backingStore removeObjectForKey:key];
    }
}

id autoDictionryGetter(id self,SEL _cmd){
    AutoDictionry * typeSelf = (AutoDictionry *)self;
    NSMutableDictionary * backingStore = typeSelf.backingStore;
    
    NSString * key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}
@end
