//
//  ViewController.m
//  02_Sington
//
//  Created by 焕焕 on 2019/3/18.
//  Copyright © 2019 焕焕. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoManager.h"
#import "NewManagerCentre.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UserInfoManager * centre = [UserInfoManager managerCenter];
    NSLog(@"%@",centre.name);
//    [NewManagerCentre managerCenter];
    NSLog(@"%@",[UserInfoManager managerCenter]);
      NSLog(@"%@",[[UserInfoManager alloc]init]);
    //[UIApplication  sharedApplication]
//    [NSNotificationCenter defaultCenter]addObserver:<#(nonnull id)#> selector:<#(nonnull SEL)#> name:<#(nullable NSNotificationName)#> object:<#(nullable id)#>
//    [NSUserDefaults standardUserDefaults]setObject:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
//    [NSFileManager defaultManager]
    // Do any additional setup after loading the view, typically from a nib.
    //共享信息，管理中心
    //破坏了封装性
}


@end
