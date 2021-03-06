//
//  AppDelegate.m
//  FaceRecognition
//
//  Created by Remi Robert on 29/03/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingsKey.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)initSettingsFirstLaunch {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:SETTINGS_INIT]) {\
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:SETTINGS_SPEECK];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:SETTINGS_DETECTION_ANGLE];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:SETTINGS_INIT];
    }
}

- (void)configureApperance {
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [UINavigationBar appearance].shadowImage = [UIImage new];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    tabBar.items[0].image = [[UIImage imageNamed:@"scanImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBar.items[0].selectedImage = [[UIImage imageNamed:@"scanImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabBar.items[1].image = [[UIImage imageNamed:@"contactImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBar.items[1].selectedImage = [[UIImage imageNamed:@"contactImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    tabBar.items[2].image = [[UIImage imageNamed:@"settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBar.items[2].selectedImage = [[UIImage imageNamed:@"settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, tabBar.bounds.size.height)];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [blurView setEffect:blurEffect];
    
    [tabBar insertSubview:blurView atIndex:0];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureApperance];
    [self initSettingsFirstLaunch];
    return YES;
}

@end
