//
//  ViewController.m
//  Message
//
//  Created by sz on 2019/3/3.
//  Copyright © 2019 Qin. All rights reserved.
//

#import "ViewController.h"
#import "AutoDictionry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AutoDictionry * dict = [AutoDictionry new];
    dict.date = [NSDate dateWithTimeIntervalSince1970:475372800];
    NSLog(@"dict.date:%@",dict.date);
}


@end
