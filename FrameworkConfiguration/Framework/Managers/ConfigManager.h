//
//  ConfigManager.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Runtime.h"

@interface ConfigManager : NSObject

@property (nonatomic, readonly) id customConfig;

+ (instancetype)sharedInstance;

- (void)loadAllConfigurations:(Class)customConfigClass;

@end
