//
//  Game2Config.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"

#import "ConfigManager.h"
@class Game2Config;

@interface ConfigManager (Game2Config)

@property (nonatomic, strong) Game2Config *game2Config;

@end


@protocol Game2ConfigProtocol <NSObject>

- (Game2Config*)customGame2Config;

@end



@interface Game2Config : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString *appName;

@end
