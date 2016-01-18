//
//  NSObject+Basic.m
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 14/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import "NSObject+Basic.h"

@implementation NSObject (Basic)

bool isCGRect(CGRect rect) {
    if (CGRectIsNull(rect) || CGRectIsEmpty(rect) || CGRectIsInfinite(rect)) {
        return 0;
    }
    return 1;
}

@end
