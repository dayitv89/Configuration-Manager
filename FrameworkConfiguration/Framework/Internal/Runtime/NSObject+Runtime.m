//
//  NSObject+Runtime.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "NSObject+Runtime.h"


@implementation NSObject (Runtime)

#pragma mark - IVARs
+ (NSArray <NSString *>*)getAllIVARsTillTargetClass:(Class)classNameTarget {
    if (!classNameTarget) {
        classNameTarget = [NSObject class];
    }
    NSMutableArray *arrayIVARs = [NSMutableArray new];
    Class className = [self class];
    while (className) {
        unsigned int count;
        Ivar* ivars = class_copyIvarList(className, &count);
        for(unsigned int i = 0; i < count; ++i) {
            NSString *key = [NSString stringWithFormat:@"%s",ivar_getName(ivars[i])];
            [arrayIVARs addObject:key];
        }
        if (className == classNameTarget) {
            break;
        }
        className = class_getSuperclass(className);
    }
    return arrayIVARs;
}

#pragma mark - Protocol
+ (NSArray <NSDictionary *>*)protocolMethodList:(Protocol*)p
                          isRequiredMethod:(BOOL)isRequied
                          isInstanceMethod:(BOOL)isInstance {
    unsigned int mc = 0;
    struct objc_method_description *mlist = (protocol_copyMethodDescriptionList(p, isRequied, isInstance, &mc));
    NSMutableArray *arrayMethodNames = [NSMutableArray new];
    for(int i = 0; i < mc ; i++, mlist++) {
        MethodNameModel *m = [MethodNameModel new];
        m.methodName = mlist->name;
        m.methodArgumentsTypes = [NSString stringWithFormat:@"%s", mlist->types];
        [arrayMethodNames addObject:m];
    }
    return arrayMethodNames;
}

#pragma mark - Property
+ (NSArray <PropertyInfoModel *>*)getAllPropertyNames {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *arrayProperties = [NSMutableArray new];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *setter = [self setterName:property];
        const char *getter = [self getterName:property];
        
        PropertyInfoModel *p = [PropertyInfoModel new];
        p.name = [NSString stringWithFormat:@"%s", property_getName(property)];
        p.attributes = [NSString stringWithFormat:@"%s", property_getAttributes(property)];
        p.property = property;
        p.setterName = NSSelectorFromString([NSString stringWithFormat:@"%s", setter]);
        p.getterName = NSSelectorFromString([NSString stringWithFormat:@"%s", getter]);
#ifdef DEBUG
        fprintf(stdout, "%s %s attri: %s\n", property_getName(property), setter, property_getAttributes(property));
#endif
    }
    return arrayProperties;
}

+ (const char *)setterName:(objc_property_t)property {
    char *setter = property_copyAttributeValue(property, "S");
    if (setter == NULL) {
        const char *varName = property_getName(property);
        size_t len = strlen(varName) + 4 + 1; /* four for extra char (set+:), one for trailing zero */
        setter = malloc(len);
        snprintf(setter, len, "set%s:", varName);
        if (setter[3]>= 97 && setter[3] <= 122) {
            setter[3] = setter[3] - 32;
        }
    }
    return setter;
}

+ (const char *)getterName:(objc_property_t)property {
    const char *getter = property_copyAttributeValue(property, "G");
    if (getter == NULL) {
        getter = property_getName(property);
    }
    return getter;
}

#pragma mark - Class

@end
