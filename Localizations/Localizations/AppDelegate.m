//
//  AppDelegate.m
//  Localizations
//
//  Created by 杨世川 on 18/1/17.
//  Copyright © 2018年 杨世川. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self systemLanguage];
    return YES;
}

#pragma mark - 系统语言
- (void)systemLanguage
{
    //获取当前设备语言
    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
    NSArray *appLanguages = [defaultUser objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    NSString *languageType;

    if ([languageName containsString:@"zh-Hans"])
    {//中文
        languageType = @"zh-Hans";
    }
    else if([languageName containsString:@"en"])
    {
        languageType = @"en";
    }
    else
    {
        languageType = @"zh-Hans";
    }

    [[NSUserDefaults standardUserDefaults] setObject:languageType forKey:AppleLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
