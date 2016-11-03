using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;
using Uno.UX;
using Uno;
using Uno.Compiler.ExportTargetInterop;

[Require("Xcode.FrameworkDirectory", "@('iOS_libs':Path)")]
[Require("Xcode.Framework", "@('iOS_libs/UnityAds.framework':Path)")]
[Require("Source.Import", "UnityAdsManager.h")]

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
        bool _b= isReady();
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
        //UnityAdsAndroid ads = new UnityAdsAndroid();
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

    static extern(!iOS) void initAds()
    {
        debug_log("Not supported!");
    }

    static extern(!iOS) bool isReady()
    {
        debug_log("Not supported!");
        return false;
    }

    static extern(!iOS) void showAds()
    {
        debug_log("Not supported!");
    }
}