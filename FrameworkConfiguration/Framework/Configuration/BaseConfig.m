//
//  BaseConfig.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "BaseConfig.h"

@implementation BaseConfig

+ (instancetype)sharedInstance {
    [NSException raise:@"Call to unimplemented sharedInstance,"
                format:@"Sample code add macro as \n\n@implementation %@ \n\nCREATE_SHARED_INSTANCE\n\n...\nyour other code\n...\n  \n@end\n\n", NSStringFromClass([self class])];
    return nil;
}

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
    
    if (![obj isKindOfClass:[BaseConfig class]]) {
        obj = nil;
    }
    [self setBaseConfigurationFrom:obj];
    if ([self conformsToProtocol:@protocol(BaseConfigProtocol)]) {
        [self performSelector:@selector(setDefaultConfigurationFrom:) withObject:obj];
    }
    return self;
}

- (void)setBaseConfigurationFrom:(id)obj {}

- (void)loadConfigurations {
    id objCustom = [[NSClassFromString(@"CustomConfig") alloc] init];
    if (objCustom && [self conformsToProtocol:@protocol(BaseConfigProtocol)]) {
       [self performSelector:@selector(callDataSourceForCustom:) withObject:objCustom];
    }
}

#pragma mark - do nothing methods & runtime class
- (void)setValue:(id)value forKey:(NSString *)key {}

- (void)setterDoNothing:(id)nothing {}

- (instancetype)createClassWithoutSetter:(Class)className {
    //-- make new class name prefix as PK_
    Class mySubclass = objc_allocateClassPair(className, [[NSString stringWithFormat:@"PK_%@",NSStringFromClass(className)] UTF8String], 0);
    
    //-- all setter method names
    NSArray <PropertyInfoModel*> *arrayPropertyList = [className getAllPropertyNames];
    for (PropertyInfoModel *property in arrayPropertyList) {
        Method m2 = class_getInstanceMethod(className, @selector(setterDoNothing:));
        IMP imp2 = method_getImplementation(m2);
        class_addMethod(mySubclass, property.setterName, (IMP)imp2, "v@:@");
    }
    objc_registerClassPair(mySubclass);
    
    //-- create new runtime class instance
    return [[mySubclass alloc] initWithDefaultObject:self];
}

@end
