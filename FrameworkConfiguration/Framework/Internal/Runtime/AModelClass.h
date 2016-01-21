//
//  InternalRuntimeModels.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MethodNameModel : NSObject

@property (nonatomic) SEL methodName;
@property (nonatomic) NSString *methodArgumentsTypes;

@end


@interface PropertyInfoModel : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *attributes;
@property (nonatomic) objc_property_t property;
@property (nonatomic) SEL setterName;
@property (nonatomic) SEL getterName;

@end