//
//  AppConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig

CREATE_SHARED_INSTANCE

- (void)setDefaultConfigurationFrom:(id)obj {
    AppConfig *appConfig = (AppConfig*)obj;
    _appName = appConfig.appName?:@"AppConfig App";
    _appVersion = appConfig.appVersion?:@"1.0.1";
    _appUserMiniumAge = appConfig.appUserMiniumAge?:15;
    _appBaseFrameSize = isCGRect(appConfig.appBaseFrameSize)?appConfig.appBaseFrameSize:CGRectMake(2,2,316, 476);
}

- (void)callDataSourceForCustom:(id)objCustom {
    if (objCustom && [objCustom conformsToProtocol:@protocol(AppConfigProtocol)]) {
        [objCustom customAppConfig:self];
    }
}

@end
