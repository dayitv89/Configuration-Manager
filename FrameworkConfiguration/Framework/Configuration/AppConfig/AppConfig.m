//
//  AppConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "AppConfig.h"


static void * configPropertyKey = &configPropertyKey;

@implementation ConfigManager (AppConfig)

- (AppConfig *)appConfig {
    return objc_getAssociatedObject(self, configPropertyKey);
}

- (void)setAppConfig:(AppConfig *)appConfig {
    if (![self appConfig]) {
        if ([self.customConfig conformsToProtocol:@protocol(AppConfigProtocol)]) {
            appConfig = [self.customConfig customAppConfig];
        } else {
            appConfig = [[AppConfig alloc] initWithDefaultObject:nil];
        }
        appConfig = [appConfig createClassWithoutSetter:[AppConfig class]];
        objc_setAssociatedObject(self, configPropertyKey, appConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end


@implementation AppConfig

- (void)setDefaultConfigurationFrom:(id)obj {
    AppConfig *appConfig = (AppConfig*)obj;
    _appName = appConfig.appName?:@"AppConfig App";
    _appVersion = appConfig.appVersion?:@"1.0.1";
    _appUserMiniumAge = appConfig.appUserMiniumAge?:15;
    _appBaseFrameSize = isCGRect(appConfig.appBaseFrameSize)?appConfig.appBaseFrameSize:CGRectMake(2,2,316, 476);
}

@end
