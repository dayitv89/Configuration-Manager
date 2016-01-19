# Configuration Manager

Rules for making new Configuration class
- Must inherit from `BaseConfig`
- Must implement the protocol `BaseConfigProtocol`
- Must write `CREATE_SHARED_INSTANCE` after the @implement ClassName (Override the `+sharedInstance` method by the macro defined in `BaseConfig`)
****
- Must set properties value by iVAR name instead of setter in `setDefaultConfigurationFrom:` method. (Because in runtime class all setter override to do nothing method)

use **_appName** instead of ~~self.appName~~

```Objective-c
- (void)setDefaultConfigurationFrom:(id)obj {
    AppConfig *appConfig = (AppConfig*)obj;
    ✓ _appName = appConfig.appName?:@"AppConfig App";  
    ✗ self.appName = appConfig.appName?:@"AppConfig App";
}
```
****
### Sample code for `AppConfig`
`AppConfig.h`
```Objective-c
#import "BaseConfig.h"

@interface AppConfig : BaseConfig <BaseConfigProtocol>

@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic) NSInteger appUserMiniumAge;

@end


@protocol AppConfigProtocol <NSObject>

- (void)customAppConfig:(AppConfig*)appConfig;

@end
```

`AppConfig.m`
```Objective-c
#import "AppConfig.h"

@implementation AppConfig

CREATE_SHARED_INSTANCE

- (void)setDefaultConfigurationFrom:(id)obj {
    AppConfig *appConfig = (AppConfig*)obj;
    _appName = appConfig.appName?:@"AppConfig App";
    _appVersion = appConfig.appVersion?:@"1.0.1";
    _appUserMiniumAge = appConfig.appUserMiniumAge?:15;
}

- (void)callDataSourceForCustom:(id)objCustom {
    if (objCustom && [objCustom conformsToProtocol:@protocol(AppConfigProtocol)]) {
        [objCustom customAppConfig:self];
    }
}

@end
```
