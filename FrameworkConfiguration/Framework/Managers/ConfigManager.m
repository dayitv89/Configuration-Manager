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
    });
    return _sharedInstance;
}


/**
 *  Call all the config files which is added by the category and class extention of `ConfigManager`
 *  Make their runtime class with setter do nothing, create object with the config data.
 */
- (void)loadAllConfigurations:(Class)CustomConfigClass {
    if (!_customConfig) {
        if (CustomConfigClass) {
            _customConfig = [[CustomConfigClass alloc] init];
        } else {
            _customConfig = [[NSObject alloc] init];
        }

        NSArray <PropertyInfoModel *>*arrayProperties = [[self class] getAllPropertyNames];
        for (PropertyInfoModel *property in arrayProperties) {
            if (property.setterName && [self respondsToSelector:property.setterName]) {
                [self performSelectorOnMainThread:property.setterName withObject:nil waitUntilDone:YES];
            }
        }
    }
    
}

- (void)setValue:(id)value forKey:(NSString *)key {}

@end
