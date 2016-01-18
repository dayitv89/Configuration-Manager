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

@protocol BaseConfigProtocol <NSObject>

- (void)setDefaultConfigurationFrom:(id)obj;

@end


@interface BaseConfig : NSObject

- (instancetype)initWithDefaultObject:(id)obj;
- (instancetype)createClassWithoutSetter:(Class)className;

@end
