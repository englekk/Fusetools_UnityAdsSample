//
//  UnityAdsManager.m
//  https://blog.WonHada.com
//
//  Created by Won Kangmin on 2016. 5. 23..
//  Copyright © 2016년 Bryan Smith. All rights reserved.
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
