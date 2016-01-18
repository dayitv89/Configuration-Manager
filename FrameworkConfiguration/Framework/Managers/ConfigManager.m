//
//  ConfigManager.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "ConfigManager.h"

@implementation ConfigManager

+ (instancetype)sharedInstance {
    static dispatch_once_t oncePredicate = 0;
    __strong static ConfigManager *_sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[super alloc] init];
        [_sharedInstance loadAllConfigurations];
    });
    return _sharedInstance;
}


/**
 *  Call all the config files which is added by the category and class extention of `ConfigManager`
 *  Make their runtime class with setter do nothing, create object with the config data.
 */
- (void)loadAllConfigurations {
    
}

@end
