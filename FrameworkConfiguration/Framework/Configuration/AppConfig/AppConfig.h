//
//  AppConfig.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"

#import "ConfigManager.h"
@class AppConfig;

@interface ConfigManager (AppConfig)

@property (nonatomic, strong) AppConfig *appConfig;

@end


@protocol AppConfigProtocol <NSObject>

- (AppConfig*)customAppConfig;

@end


@interface AppConfig : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic) NSInteger appUserMiniumAge;
@property (nonatomic) CGRect appBaseFrameSize;

@end
