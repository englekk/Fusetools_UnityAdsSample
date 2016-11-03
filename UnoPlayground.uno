using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;
using Uno.UX;
using Uno;
using Uno.Compiler.ExportTargetInterop;

[Require("Xcode.FrameworkDirectory", "@('iOS_libs':Path)")]
[Require("Xcode.Framework", "@('iOS_libs/UnityAds.framework':Path)")]

[ForeignInclude(Language.ObjC, "UnityAdsManager.h")] //[Require("Source.Import", "UnityAdsManager.h")]

[ForeignInclude(Language.Java, "com.foreign.UnityAdsAndroidListener", "com.unity3d.ads.UnityAds")]
[ForeignInclude(Language.Java, "com.fuse.Activity", "android.os.Handler", "android.os.Looper", "android.content.Context", "android.content.Intent")]

public class UnoPlayground : NativeModule
{
	public UnoPlayground()
	{
		AddMember(new NativeFunction("initAds", (NativeCallback)initAds));
        AddMember(new NativeFunction("isReady", (NativeCallback)isReady));
        AddMember(new NativeFunction("showAds", (NativeCallback)showAds));
	}

	object initAds(Context c, object[] args)
    {
    	initAds();
    	
        return null;
    }

    object isReady(Context c, object[] args)
    {
        bool _b = isReady();
        //debug_log("isReady: " + _b);
        return _b;
    }

    object showAds(Context c, object[] args)
    {
        showAds();

        return null;
    }

	[Foreign(Language.ObjC)]
    static extern(iOS) void initAds()
    @{
        NSLog(@"initAds===");
        [UnityAdsManager init];
    @}

    [Foreign(Language.ObjC)]
    static extern(iOS) bool isReady()
    @{
        BOOL _b = [UnityAdsManager isReady];
        //NSLog(@"isReady===%d", _b);
        return _b;
    @}

    [Foreign(Language.ObjC)]
    static extern(iOS) void showAds()
    @{
        NSLog(@"showAds===");
        [UnityAdsManager showAds];
    @}

    [Foreign(Language.Java)]
    static extern(Android) void initAds()
    @{
        Handler mHandler = new Handler(Looper.getMainLooper());
        mHandler.postDelayed(new Runnable() {
            @Override
            public void run() {
                android.util.Log.d("---", "initAds===");
                android.app.Activity _main = Activity.getRootActivity();
                UnityAds.initialize(_main, "1186682", new UnityAdsAndroidListener());
            }
        }, 0);
    @}

    [Foreign(Language.Java)]
    static extern(Android) bool isReady()
    @{
        return UnityAds.isReady();
    @}

    [Foreign(Language.Java)]
    static extern(Android) void showAds()
    @{
        /* 액티비티 실행 방법
        Context _main = Activity.getRootActivity();// (= android.app.Activity _main)
        Intent intent = new Intent(_main, UnityAdsAndroidListener.class);
        //intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        _main.startActivity(intent);*/

        android.app.Activity _main = Activity.getRootActivity();
        UnityAds.show(_main);
    @}

    static extern(!Mobile) void initAds()
    {
        debug_log("Not supported!");
    }

    static extern(!Mobile) bool isReady()
    {
        debug_log("Not supported!");
        return false;
    }

    static extern(!Mobile) void showAds()
    {
        debug_log("Not supported!");
    }
}