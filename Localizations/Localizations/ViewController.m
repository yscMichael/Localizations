//
//  ViewController.m
//  Localizations
//
//  Created by 杨世川 on 18/1/17.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *languageType;
@property (nonatomic,strong) NSBundle *languageBundle;
@property (nonatomic,strong) UIButton *clickButton;
@property (nonatomic,strong) UIButton *languageButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self systemLanguage];
    [self initSubviews];
}

#pragma mark - 系统语言
- (void)systemLanguage
{
    //获取当前设备语言
    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
    NSArray *appLanguages = [defaultUser objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    NSLog(@"languageName = %@",languageName);

    if ([languageName containsString:@"zh-Hans"])
    {//中文
        self.languageType = @"zh-Hans";
    }
    else if([languageName containsString:@"en"])
    {//英文
        self.languageType = @"en";
    }
    else
    {
        self.languageType = @"zh-Hans";
    }
}

#pragma mark - 初始化
- (void)initSubviews
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    self.clickButton = button;
    button.backgroundColor = [UIColor blueColor];
    NSString *title = NSLocalizedString(@"ButtonTitle", nil);
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];

    UIButton *languageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.languageButton = languageButton;
    languageButton.backgroundColor = [UIColor blueColor];
    NSString *language = NSLocalizedString(@"Language", nil);
    [languageButton setTitle:language forState:UIControlStateNormal];
    [languageButton addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:languageButton];
}

#pragma mark - 更改语言
- (void)changeLanguage:(UIButton *)sender
{
    self.languageType = [self.languageType isEqualToString:@"zh-Hans"] ? @"en" : @"zh-Hans";
    NSLog(@"self.languageType = %@",self.languageType);
    [self changeTitle];
}

- (void)changeTitle
{
    NSString *languagePath = [[NSBundle mainBundle] pathForResource:self.languageType ofType:@"lproj"];
    self.languageBundle = [NSBundle bundleWithPath:languagePath];

    NSString *clickString = [self.languageBundle localizedStringForKey:@"ButtonTitle" value:nil table:@"Localizable"];
    NSString *languageString = [self.languageBundle localizedStringForKey:@"Language" value:nil table:@"Localizable"];
    [self.clickButton setTitle:clickString forState:UIControlStateNormal];
    [self.languageButton setTitle:languageString forState:UIControlStateNormal];
}

@end




