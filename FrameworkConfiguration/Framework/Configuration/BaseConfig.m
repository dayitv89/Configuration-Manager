//
//  BaseConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"

@implementation BaseConfig

- (instancetype)init {
    if (!self) {
        self = [self initWithDefaultObject:nil];
    }
    return self;
}

- (instancetype)initWithDefaultObject:(id)obj {
    if (!self) {
        self = [super init];
    }
    if (![obj isKindOfClass:[self class]]) {
        obj = nil;
    }
    [self setBaseConfigurationFrom:obj];
    if ([self conformsToProtocol:@protocol(BaseConfigProtocol)]) {
        [self performSelector:@selector(setDefaultConfigurationFrom:) withObject:obj];
    }
    return self;
}

- (void)setBaseConfigurationFrom:(id)obj {}

#pragma mark - do nothing methods
- (void)setValue:(id)value forKey:(NSString *)key {}

@end
