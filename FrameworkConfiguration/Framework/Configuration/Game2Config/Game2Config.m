//
//  Game2Config.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "Game2Config.h"

static void * configPropertyKey = &configPropertyKey;

@implementation ConfigManager (Game2Config)

- (Game2Config *)game2Config {
    return objc_getAssociatedObject(self, configPropertyKey);
}

- (void)setGame2Config:(Game2Config *)appConfig {
    if (![self game2Config]) {
        if ([self.customConfig conformsToProtocol:@protocol(Game2ConfigProtocol)]) {
            appConfig = [self.customConfig customGame2Config];
        } else {
            appConfig = [[Game2Config alloc] initWithDefaultObject:nil];
        }
        appConfig = [appConfig createClassWithoutSetter:[Game2Config class]];
        objc_setAssociatedObject(self, configPropertyKey, appConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end


@implementation Game2Config

- (void)setDefaultConfigurationFrom:(id)obj {
    Game2Config *game = (Game2Config*)obj;
    _appName = game.appName?:@"Game 2";
}

@end
