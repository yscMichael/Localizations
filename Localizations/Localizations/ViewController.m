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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self initSubviews];
}

#pragma mark - 初始化
- (void)initSubviews
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    button.backgroundColor = [UIColor blueColor];
    //NSString *title = AppLocalizableString(@"ButtonTitle",@"Localizable");
    NSString *title = AppBundleLocalizableString(@"ButtonTitle", @"Localizable", @"language");
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *languageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    languageButton.backgroundColor = [UIColor blueColor];
    //NSString *language = AppLocalizableString(@"Language",@"Localizable");
    NSString *language = AppBundleLocalizableString(@"Language", @"Localizable", @"language");
    [languageButton setTitle:language forState:UIControlStateNormal];
    [languageButton addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:languageButton];
}

#pragma mark - 更改语言
- (void)changeLanguage:(UIButton *)sender
{
    NSString *languageType = [[NSUserDefaults standardUserDefaults] objectForKey:AppleLanguage];
    languageType = [languageType isEqualToString:@"zh-Hans"] ? @"en" : @"zh-Hans";
    [[NSUserDefaults standardUserDefaults] setObject:languageType forKey:AppleLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];

    ViewController *viewContriller = [[ViewController alloc]init];
    [self presentViewController:viewContriller animated:YES completion:^{
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

@end




