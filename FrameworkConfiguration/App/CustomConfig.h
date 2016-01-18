//
//  CustomConfig.h
//  FrameworkConfiguration
//
//  Created by Gaurav Sharma on 18/01/16.
//  Copyright © 2016 iOS Dev Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "Game1Config.h"

@interface CustomConfig : NSObject <AppConfigProtocol, Game1ConfigProtocol>

@end
