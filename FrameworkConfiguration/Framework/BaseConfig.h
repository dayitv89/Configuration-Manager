//
//  BaseConfig.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Runtime.h"
#import "NSObject+Basic.h"

#define CREATE_SHARED_INSTANCE          \
+ (instancetype)sharedInstance { \
    static dispatch_once_t oncePredicate = 0; \
    static id _sharedInstance = nil; \
    dispatch_once(&oncePredicate, ^{ \
        id _sharedInstance1 = [[self alloc] init]; \
        [_sharedInstance1 loadConfigurations]; \
        _sharedInstance = [_sharedInstance1 createClassWithoutSetter:[self class]]; \
        _sharedInstance1 = nil; \
    }); \
    return _sharedInstance; \
}


@protocol BaseConfigProtocol <NSObject>

- (void)setDefaultConfigurationFrom:(id)objSelf;
- (void)callDataSourceForCustom:(id)objCustom;

@end


@interface BaseConfig : NSObject


+ (instancetype)sharedInstance;
- (instancetype)init NS_UNAVAILABLE;
- (void)loadConfigurations;
- (instancetype)createClassWithoutSetter:(Class)className;

@end
