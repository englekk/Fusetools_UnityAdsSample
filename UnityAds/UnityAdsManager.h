//
//  Author: Kangmin Won
//  Blog: https://blog.wonhada.com
//  Fuse Community: https://www.facebook.com/groups/fusetools/
//  License: MIT
//

#import "UnityAds/UnityAds.h"

@interface UnityAdsManager : UIViewController<UnityAdsDelegate>

+ (void) init;
+ (BOOL) isReady;
+ (void) showAds;

- (void)unityAdsReady:(NSString *)placementId;
- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message;
- (void)unityAdsDidStart:(NSString *)placementId;
- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state;

@end
