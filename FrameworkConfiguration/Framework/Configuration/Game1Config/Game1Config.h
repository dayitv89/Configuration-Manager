//
//  Game1Config.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"


@interface Game1Config : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic) NSInteger appUserMiniumAge;
@property (nonatomic) CGRect appBaseFrameSize;

- (void)loadConfigurations NS_UNAVAILABLE;

@end


@protocol Game1ConfigProtocol <NSObject>

- (void)customGame1Config:(Game1Config*)gameConfig;

@end