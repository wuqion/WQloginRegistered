//
//  WQ_LoginVC.m
//  Volunteer
//
//  Created by 联创—王增辉 on 2019/1/8.
//  Copyright © 2019年 Xinhuanet. All rights reserved.
//

#import "WQ_LoginVC.h"
#import "WQ_RegisterVC.h"
#import "AppDefine.h"
#import <Masonry.h>
#import "UIView+WQ_Corners.h"

@interface WQ_LoginVC ()

@property (strong, nonatomic) UITextField *phoneNum;
@property (strong, nonatomic) UITextField *passWordNum;



@end

@implementation WQ_LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WQ_COLOR_WHITE;
    self.title = @"用户登录";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self addUI];
    [self setNavi];

}
- (void)setNavi{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    leftBtn.frame = CGRectMake(0, 0, 40, 44);
    [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addUI
{
    UIImageView * headImg = [UIImageView new];
    headImg.image = WQ_IMG(@"log_icon");
    [self.view addSubview:headImg];
    WeakSelf
    UIView * bgView = weakSelf.view;
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).offset(106);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(94, 94));
    }];
    
    UIView * border = [UIView new];
    [border settingBorder:16 borderWidth:1 borderColor:WQ_COLOR_GRAY];
    [self.view addSubview:border];
    
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headImg.mas_bottom).offset(30);
        make.left.equalTo(bgView.mas_left).offset(30);
        make.right.equalTo(bgView.mas_right).offset(-30);
        make.height.mas_equalTo(40);
    }];
    
    self.phoneNum = [[UITextField alloc]init];
    self.phoneNum.placeholder = @"请输入手机号";
    self.phoneNum.font = WQ_FONT13;
    [self.view addSubview:self.phoneNum];
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border).offset(6);
        make.left.equalTo(border).offset(16);
        make.right.bottom.equalTo(border).offset(-6);
    }];
    
    UIView * border1 = [UIView new];
    [border1 settingBorder:16 borderWidth:1 borderColor:WQ_COLOR_GRAY];
    [self.view addSubview:border1];
    
    [border1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border.mas_bottom).offset(26);
        make.left.equalTo(bgView.mas_left).offset(30);
        make.right.equalTo(bgView.mas_right).offset(-30);
        make.height.mas_equalTo(40);
    }];
    
    self.passWordNum = [[UITextField alloc]init];
    self.passWordNum.placeholder = @"请输入登录密码";
    self.passWordNum.font = WQ_FONT13;
    [self.view addSubview:self.passWordNum];
    [self.passWordNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border1).offset(6);
        make.left.equalTo(border1).offset(16);
        make.right.bottom.equalTo(border1).offset(-6);
    }];
    
    UIButton * loginBtn = [[UIButton alloc]init];
    loginBtn.titleLabel.font = WQ_FONT17;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:WQ_COLOR_WHITE forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:WQ_COLOR_RED];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius  = 16;
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(border1);
        make.top.equalTo(border1.mas_bottom).offset(48);
        make.height.mas_offset(40);
    }];
    
    UIButton * registerBtn = [[UIButton alloc]init];
    registerBtn.titleLabel.font = WQ_FONT15;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:WQ_COLOR_ORANGE forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginBtn).offset(3);
        make.top.equalTo(loginBtn.mas_bottom).offset(8);
    }];
    
    
    UIButton * forgetBtn = [[UIButton alloc]init];
    forgetBtn.titleLabel.font = WQ_FONT15;
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:WQ_COLOR_ORANGE forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(loginBtn.mas_right).offset(-3);
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
    }];
    
    UIButton * WchatBtn = [[UIButton alloc]init];
    UIImage * WchatImg = WQ_IMG(@"wchart");
    [WchatBtn setImage:WchatImg forState:UIControlStateNormal];
    [WchatBtn addTarget:self action:@selector(WchartloginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:WchatBtn];
    
    [WchatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.mas_bottom).offset(-50);
        make.centerX.equalTo(bgView);
        make.size.mas_offset(CGSizeMake(44, 44));
    }];
    
    UIButton * QQBtn = [[UIButton alloc]init];
    UIImage * QQimg = WQ_IMG(@"QQ");
    [QQBtn setImage:QQimg forState:UIControlStateNormal];
    [QQBtn addTarget:self action:@selector(QQloginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:QQBtn];
    
    [QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(WchatBtn);
        make.size.equalTo(WchatBtn);
        make.right.equalTo(WchatBtn.mas_left).offset(-30);
    }];
    
    UIButton * SinaBtn = [[UIButton alloc]init];
    UIImage * Sinaimg = WQ_IMG(@"sina");
    [SinaBtn setImage:Sinaimg forState:UIControlStateNormal];
    [SinaBtn addTarget:self action:@selector(SinaloginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SinaBtn];
    
    [SinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(WchatBtn);
        make.size.equalTo(WchatBtn);
        make.left.equalTo(WchatBtn.mas_right).offset(30);
    }];
    
    UILabel * titleLB = [UILabel new];
    titleLB.text = @"其他方式登录";
    titleLB.font = WQ_FONT15;
    titleLB.textColor = WQ_COLOR_BLACK;
    [self.view addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(WchatBtn);
        make.bottom.equalTo(WchatBtn.mas_top).offset(-21);
    }];
    
    UIView * leftLine = [UIView new];
    leftLine.backgroundColor = WQ_COLOR_GRAY;
    [self.view addSubview:leftLine];
    
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView);
        make.height.mas_offset(1);
        make.right.equalTo(titleLB.mas_left).offset(-10);
        make.centerY.equalTo(titleLB);
    }];
    
    UIView * rightLine = [UIView new];
    rightLine.backgroundColor = WQ_COLOR_GRAY;
    [self.view addSubview:rightLine];
    
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView);
        make.height.mas_offset(1);
        make.left.equalTo(titleLB.mas_right).offset(10);
        make.centerY.equalTo(titleLB);
    }];
    
    
}
#pragma mark - QQ登录
- (void)QQloginAction:(UIButton *)button
{
     NSLog(@"QQ登录");
}
#pragma mark - 微信登录
- (void)WchartloginAction:(UIButton *)button
{
     NSLog(@"微信登录");
}
#pragma mark - 新浪登录
- (void)SinaloginAction:(UIButton *)button
{
     NSLog(@"新浪登录");
}
#pragma mark - 登录
- (void)loginAction:(UIButton *)button
{
    NSLog(@"登录");
}
#pragma mark - 注册
- (void)registerAction:(UIButton *)button
{
    NSLog(@"注册");
    WQ_RegisterVC * vc = [WQ_RegisterVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 忘记密码
- (void)forgetAction:(UIButton *)button
{
    NSLog(@"忘记密码");
}



@end
