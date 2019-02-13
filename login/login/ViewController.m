//
//  ViewController.m
//  login
//
//  Created by 联创—王增辉 on 2019/2/13.
//  Copyright © 2019年 lcWorld. All rights reserved.
//

#import "ViewController.h"
#import "WQ_LoginVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)login:(id)sender {
    
    WQ_LoginVC *baseTabarVC  = [[WQ_LoginVC alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:baseTabarVC];
    [self presentViewController:navi animated:YES completion:nil];
    
}


@end
