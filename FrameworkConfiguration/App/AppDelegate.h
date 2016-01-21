//
//  AppDelegate.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConfig.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) AppConfig *appConfigHack;

@end

