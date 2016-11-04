//
//  Author: Kangmin Won
//  Blog: https://blog.wonhada.com
//  Fuse Community: https://www.facebook.com/groups/fusetools/
//  License: MIT
//

#import "UnityAdsManager.h"

@implementation UnityAdsManager

UnityAdsManager *_this;
UIView *topView;

+ (void) init {
    _this = [[UnityAdsManager alloc] init];
    // _this.view.backgroundColor = [UIColor greenColor];

    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    topView = window.rootViewController.view;

    [UnityAds initialize:@"1186681" delegate:_this testMode:true];
}

+ (BOOL) isReady
{
    return [UnityAds isReady:@"rewardedVideo"];
}

+ (void) showAds
{
    [topView addSubview:_this.view];

    [UnityAds show:_this placementId:@"rewardedVideo"];
}

- (void)unityAdsReady:(NSString *)placementId{
    NSLog(@"unityAdsReady");
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message{
    NSLog(@"unityAdsDidError");
}

- (void)unityAdsDidStart:(NSString *)placementId{
    NSLog(@"unityAdsDidStart");
}

- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state{
    NSLog(@"unityAdsDidFinish");
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeView) userInfo:nil repeats:NO];
}

- (void) removeView
{
    [_this.view removeFromSuperview];

    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"blog.WonHada.com" 
                                                     message:@"Thanks Fuser! Have a good day! :-)"
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil, nil];


    [av show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Complete!");
}

@end