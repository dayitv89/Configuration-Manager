//
//  Game1Config.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "Game1Config.h"

static void * configPropertyKey = &configPropertyKey;

@implementation ConfigManager (Game1Config)

- (Game1Config *)game1Config {
    return objc_getAssociatedObject(self, configPropertyKey);
}

- (void)setGame1Config:(Game1Config *)appConfig {
    if (![self game1Config]) {
        if ([self.customConfig conformsToProtocol:@protocol(Game1ConfigProtocol)]) {
            appConfig = [self.customConfig customGame1Config];
        } else {
            appConfig = [[Game1Config alloc] initWithDefaultObject:nil];
        }
        appConfig = [appConfig createClassWithoutSetter:[Game1Config class]];
        objc_setAssociatedObject(self, configPropertyKey, appConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end


@implementation Game1Config

- (void)setDefaultConfigurationFrom:(id)obj {
    Game1Config *appConfig = (Game1Config*)obj;
    _appName = appConfig.appName?:@"AppConfig App";
    _appVersion = appConfig.appVersion?:@"1.0.1";
    _appUserMiniumAge = appConfig.appUserMiniumAge?:15;
    _appBaseFrameSize = isCGRect(appConfig.appBaseFrameSize)?appConfig.appBaseFrameSize:CGRectMake(2,2,316, 476);
}

@end
