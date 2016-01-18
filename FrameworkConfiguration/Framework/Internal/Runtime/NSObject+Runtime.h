//
//  NSObject+Runtime.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "InternalRuntimeModels.h"

@interface NSObject (Runtime)

+ (NSArray <MethodNameModel *>*)getAllIVARsTillTargetClass:(Class)classNameTarget;

+ (NSArray <NSDictionary *>*)protocolMethodList:(Protocol*)p
                               isRequiredMethod:(BOOL)isRequied
                               isInstanceMethod:(BOOL)isInstance;

+ (NSArray <PropertyInfoModel *>*)getAllPropertyNames;
+ (const char *)setterName:(objc_property_t)property;
+ (const char *)getterName:(objc_property_t)property;

+ (NSArray <NSString*>*)getAllProtocolList;

@end
