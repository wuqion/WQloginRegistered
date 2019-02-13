//
//  WQ_RegisterVC.m
//  Volunteer
//
//  Created by 联创—王增辉 on 2019/1/8.
//  Copyright © 2019年 Xinhuanet. All rights reserved.
//

#import "WQ_RegisterVC.h"
#import "WQ_AgreementVC.h"
#import "AppDefine.h"
#import <Masonry.h>
#import "UIView+WQ_Corners.h"
#define time 60

@interface WQ_RegisterVC ()<UITextViewDelegate>


@property (strong, nonatomic) UITextField *phoneNum;
@property (strong, nonatomic) UITextField *passWordNum;
@property (strong, nonatomic) UITextField *codeNum;
@property (strong, nonatomic) UIButton    *getCodeNum;

@property (assign, nonatomic) NSInteger timeNum;


@end

@implementation WQ_RegisterVC
{
    dispatch_source_t timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WQ_COLOR_WHITE;
    self.title = @"用户注册";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self addUI];
    
}
- (void)addUI
{
    UIImageView * headImg = [UIImageView new];
    headImg.image = WQ_IMG(@"log_icon");
    [self.view addSubview:headImg];
    WeakSelf
    UIView * bgView = weakSelf.view;
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).offset(88);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    UIView * border = [UIView new];
    [border settingBorder:7 borderWidth:1 borderColor:WQ_COLOR_GRAY];
    [self.view addSubview:border];
    
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headImg.mas_bottom).offset(15);
        make.left.equalTo(bgView.mas_left).offset(30);
        make.right.equalTo(bgView.mas_right).offset(-30);
        make.height.mas_equalTo(44);
    }];
    
    self.phoneNum = [[UITextField alloc]init];
    self.phoneNum.placeholder = @"请输入手机号";
    self.phoneNum.font = WQ_FONT13;
    [self.view addSubview:self.phoneNum];
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(border).offset(6);
        make.right.bottom.equalTo(border).offset(-6);
    }];
    
    UIView * border1 = [UIView new];
    [border1 settingBorder:7 borderWidth:1 borderColor:WQ_COLOR_GRAY];
    [self.view addSubview:border1];
    
    [border1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border.mas_bottom).offset(10);
        make.left.equalTo(bgView.mas_left).offset(30);
        make.right.equalTo(bgView.mas_right).offset(-30);
        make.height.mas_equalTo(44);
    }];
    
    self.codeNum = [[UITextField alloc]init];
    self.codeNum.placeholder = @"请输入验证码";
    self.codeNum.font        = WQ_FONT13;
    [self.view addSubview:self.codeNum];
    [self.codeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(border1).offset(6);
        make.right.bottom.equalTo(border1).offset(-6);
    }];
    
    self.getCodeNum = [UIButton new];
    [self.getCodeNum setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getCodeNum setTitleColor:WQ_COLOR_WHITE forState:UIControlStateNormal];
    [self.getCodeNum setBackgroundColor:WQ_COLOR_ORANGE];
    self.getCodeNum.titleLabel.font   = WQ_FONT10;
    self.getCodeNum.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.getCodeNum.layer.masksToBounds = YES;
    self.getCodeNum.layer.cornerRadius  = 8;
    [self.getCodeNum addTarget:self action:@selector(getCodeNumAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.getCodeNum];
    [self.getCodeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border1).offset(10);
        make.right.bottom.equalTo(border1).offset(-10);
        make.width.mas_greaterThanOrEqualTo(60);
    }];
    
    UIView * border2 = [UIView new];
    [border2 settingBorder:7 borderWidth:1 borderColor:WQ_COLOR_GRAY];
    [self.view addSubview:border2];
    
    [border2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(border1.mas_bottom).offset(10);
        make.left.equalTo(bgView.mas_left).offset(30);
        make.right.equalTo(bgView.mas_right).offset(-30);
        make.height.mas_equalTo(44);
    }];
    
    self.passWordNum = [[UITextField alloc]init];
    self.passWordNum.placeholder = @"请输入登录密码";
    self.passWordNum.font = WQ_FONT13;
    [self.view addSubview:self.passWordNum];
    [self.passWordNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(border2).offset(6);
        make.right.bottom.equalTo(border2).offset(-6);
    }];
    
    UIButton * rigisterBtn = [[UIButton alloc]init];
    rigisterBtn.titleLabel.font = WQ_FONT15;
    [rigisterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [rigisterBtn setTitleColor:WQ_COLOR_WHITE forState:UIControlStateNormal];
    [rigisterBtn setBackgroundColor:WQ_COLOR_RED];
    [rigisterBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    rigisterBtn.layer.masksToBounds = YES;
    rigisterBtn.layer.cornerRadius  = 7;
    [self.view addSubview:rigisterBtn];
    
    [rigisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(border2);
        make.top.equalTo(border1.mas_bottom).offset(20);
        make.height.mas_offset(44);
    }];
    
    UIView * bottomV = [UIView new];
    [self.view addSubview:bottomV];
    [bottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rigisterBtn.mas_bottom).offset(25);
        make.centerX.equalTo(bgView);
        make.height.mas_offset(15);
    }];
    
    UIButton * Agreed = [UIButton new];
    Agreed.backgroundColor = WQ_COLOR_ORANGE;
    [Agreed addTarget:self action:@selector(AgreedAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomV addSubview:Agreed];
    [Agreed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomV);
        make.centerY.equalTo(bottomV);
        make.size.mas_offset(CGSizeMake(13, 13));
    }];
    
    UITextView * text = [UITextView new];
    text.delegate = self;
    text.editable = NO;
    text.scrollEnabled = NO;
    [bottomV addSubview:text];
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.right.equalTo(bottomV);
        make.left.equalTo(Agreed.mas_right);
    }];
    NSString * string = @"我已认真阅读并同意用户协议 ";
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:WQ_FONT13,NSForegroundColorAttributeName:WQ_COLOR_BLACK}];

    [att setAttributes:@{NSLinkAttributeName:[NSURL URLWithString:@"agreement://"]} range:[string rangeOfString:@"用户协议"]];
    [att addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:[string rangeOfString:@"用户协议"]];
    text.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    text.attributedText = att;


}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"agreement"]) {
       
        NSLog(@"用户协议");
        WQ_AgreementVC * vc = [[WQ_AgreementVC alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}
#pragma mark - 获取验证码
- (void)getCodeNumAction:(UIButton *)button
{
    NSLog(@"获取验证码");
    if (self.timeNum !=0) {
        return;
    }
    self.timeNum = (NSInteger)time;
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        self.timeNum --;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.getCodeNum setTitle:[NSString stringWithFormat:@"%ld s",self.timeNum] forState:UIControlStateNormal];
            if (self.timeNum == 0) {
                dispatch_cancel(self->timer);
                [self.getCodeNum setTitle:@"重新获取验证码" forState:UIControlStateNormal];
                
            }
        });
    });
    dispatch_resume(timer);
}
- (void)AgreedAction:(UIButton *)button
{
    NSLog(@"同意协议");
}
#pragma mark - 注册
- (void)registerAction:(UIButton *)button
{
    NSLog(@"注册");
}




@end
