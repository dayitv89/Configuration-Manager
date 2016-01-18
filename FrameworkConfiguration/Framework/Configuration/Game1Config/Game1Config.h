//
//  Game1Config.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"

#import "ConfigManager.h"
@class Game1Config;

@interface ConfigManager (Game1Config)

@property (nonatomic, strong) Game1Config *game1Config;

@end


@protocol Game1ConfigProtocol <NSObject>

- (Game1Config*)customGame1Config;

@end


@interface Game1Config : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic) NSInteger appUserMiniumAge;
@property (nonatomic) CGRect appBaseFrameSize;

@end