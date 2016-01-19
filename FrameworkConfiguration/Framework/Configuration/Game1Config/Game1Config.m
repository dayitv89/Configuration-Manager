//
//  Game1Config.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "Game1Config.h"

@implementation Game1Config

CREATE_SHARED_INSTANCE

- (void)setDefaultConfigurationFrom:(id)obj {
    Game1Config *appConfig = (Game1Config*)obj;
    _appName = appConfig.appName?:@"Game Config App";
    _appVersion = appConfig.appVersion?:@"2.0.1";
    _appUserMiniumAge = appConfig.appUserMiniumAge?:25;
    _appBaseFrameSize = isCGRect(appConfig.appBaseFrameSize)?appConfig.appBaseFrameSize:CGRectMake(102,102,316, 476);
}

- (void)callDataSourceForCustom:(id)objCustom {
    if (objCustom && [objCustom conformsToProtocol:@protocol(Game1ConfigProtocol)]) {
        [objCustom customGame1Config:self];
    }
}

@end
