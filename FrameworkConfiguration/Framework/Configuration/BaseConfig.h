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
        _sharedInstance = [[self alloc] init]; \
        [_sharedInstance loadConfigurations]; \
        _sharedInstance = [_sharedInstance createClassWithoutSetter:[self class]]; \
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
//- (instancetype)initWithDefaultObject:(id)obj;
- (instancetype)createClassWithoutSetter:(Class)className;

@end
