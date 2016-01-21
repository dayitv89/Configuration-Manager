//
//  AppConfig.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"


@interface AppConfig : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString const * appName;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic) NSInteger appUserMiniumAge;
@property (nonatomic) CGRect appBaseFrameSize;

- (void)loadConfigurations NS_UNAVAILABLE;

@end


@protocol AppConfigProtocol <NSObject>

- (void)customAppConfig:(AppConfig*)appConfig;

@end