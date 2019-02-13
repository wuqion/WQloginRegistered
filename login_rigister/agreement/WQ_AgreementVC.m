//
//  WQ_AgreementVC.m
//  Volunteer
//
//  Created by 联创—王增辉 on 2019/1/10.
//  Copyright © 2019年 Xinhuanet. All rights reserved.
//

#import "WQ_AgreementVC.h"
#import "UIImage+WQ_Extension.h"
#import "AppDefine.h"
#import "UIView+WQ_Corners.h"
#import <Masonry.h>

@interface WQ_AgreementVC ()

@property (strong, nonatomic) UILabel *textLB;
@property (strong, nonatomic) UIButton *AgreedBtn;
@property (strong, nonatomic) UIButton *N_AgreedBtn;


@end

@implementation WQ_AgreementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self setViewFrame];
    self.textLB.text = @"     您注册“法律百科”相关服务时，跟据网站要求提供相关个人信息；在您使用“法律百科”服务、参加网站活动、或访问网站网页时，网站自动";
    self.AgreedBtn.enabled = NO;
    self.view.backgroundColor = WQ_COLOR_WHITE;
    self.title = @"用户协议";
}

- (void)addUI{
    [self.view addSubview:self.textLB];
    [self.view addSubview:self.AgreedBtn];
    [self.view addSubview:self.N_AgreedBtn];
}
- (void)setViewFrame
{
    WeakSelf
    [self.textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(105);
        make.left.equalTo(weakSelf.view.mas_left).offset(WQ_MARGIN_LEFT);
        make.right.equalTo(weakSelf.view.mas_right).offset(-WQ_MARGIN_LEFT);
    }];
    [self.N_AgreedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.textLB.mas_bottom).offset(105);
        make.left.equalTo(weakSelf.view.mas_left).offset(56);
        make.size.mas_offset(CGSizeMake(75, 28));
    }];
    [self.AgreedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-56);
        make.centerY.equalTo(weakSelf.N_AgreedBtn);
        make.size.mas_offset(CGSizeMake(75, 28));
    }];
}
- (void)buttonAction:(UIButton *)button
{
    if (button != self.AgreedBtn) {
        self.AgreedBtn.enabled = YES;
        self.N_AgreedBtn.enabled = NO;
    }else{
        self.AgreedBtn.enabled = NO;
        self.N_AgreedBtn.enabled = YES;
    }
}
- (UILabel *)textLB
{
    if (!_textLB) {
        _textLB = [UILabel new];
        _textLB.textColor = WQ_COLOR_GRAY_22;
        _textLB.font = WQ_FONT14;
        _textLB.numberOfLines = 0;
    }
    return _textLB;
}
- (UIButton *)AgreedBtn
{
    if (!_AgreedBtn) {
        _AgreedBtn = [[UIButton alloc]init];
        _AgreedBtn.adjustsImageWhenHighlighted = NO;
        [_AgreedBtn setTitle:@"同意" forState:UIControlStateNormal];
        [_AgreedBtn setTitleColor:WQ_COLOR_RED forState:UIControlStateNormal];
        [_AgreedBtn setTitleColor:WQ_COLOR_WHITE forState:UIControlStateDisabled];
        [_AgreedBtn setBackgroundImage:[UIImage imageWithColor:WQ_COLOR_RED] forState:UIControlStateDisabled];
        [_AgreedBtn setBackgroundImage:[UIImage imageWithColor:WQ_COLOR_WHITE] forState:UIControlStateNormal];
        [_AgreedBtn settingBorderWithBorderWidth:1 borderColor:WQ_COLOR_RED];
        [_AgreedBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _AgreedBtn;
}
- (UIButton *)N_AgreedBtn
{
    if (!_N_AgreedBtn) {
        _N_AgreedBtn = [[UIButton alloc]init];
        _N_AgreedBtn.adjustsImageWhenHighlighted = NO;
        [_N_AgreedBtn setTitle:@"不同意" forState:UIControlStateNormal];
        [_N_AgreedBtn setTitleColor:WQ_COLOR_RED forState:UIControlStateNormal];
        [_N_AgreedBtn setTitleColor:WQ_COLOR_WHITE forState:UIControlStateDisabled];
        [_N_AgreedBtn setBackgroundImage:[UIImage imageWithColor:WQ_COLOR_RED] forState:UIControlStateDisabled];
        [_N_AgreedBtn setBackgroundImage:[UIImage imageWithColor:WQ_COLOR_WHITE] forState:UIControlStateNormal];
        [_N_AgreedBtn settingBorderWithBorderWidth:1 borderColor:WQ_COLOR_RED];
        [_N_AgreedBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _N_AgreedBtn;
}
@end
