//
//  Author: Kangmin Won
//  Blog: https://blog.wonhada.com
//  Fuse Community: https://www.facebook.com/groups/fusetools/
//  License: MIT
//

package com.foreign;

import com.unity3d.ads.IUnityAdsListener;
import com.unity3d.ads.UnityAds;
import com.unity3d.ads.misc.Utilities;
import android.app.Activity;
import android.util.Log;
import android.widget.Toast;
import android.os.Bundle;

public class UnityAdsAndroidListener implements IUnityAdsListener
{
	@Override
	public void onUnityAdsReady(final String zoneId) {
		Log.d("---", "onUnityAdsReady: " + zoneId);
		Utilities.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// look for various default placement ids over time
				/*switch (zoneId) {
					case "video":
					case "defaultZone":
					case "defaultVideoAndPictureZone":
						// interstitialPlacementId = zoneId;
						// enableButton((Button) findViewById(R.id.unityads_example_interstitial_button));
						break;

					case "rewardedVideo":
					case "rewardedVideoZone":
					case "incentivizedZone":
						// incentivizedPlacementId = zoneId;
						// enableButton((Button) findViewById(R.id.unityads_example_incentivized_button));
						break;
				}*/
			}
		});

		toast("Ready", zoneId);
	}

	@Override
	public void onUnityAdsStart(String zoneId) {
		Log.d("---", "onUnityAdsStart: " + zoneId);
		toast("Start", zoneId);
	}

	@Override
	public void onUnityAdsFinish(String zoneId, UnityAds.FinishState result) {
		Log.d("---", "onUnityAdsFinish: " + zoneId + " - " + result);
		toast("Finish", zoneId + " " + result);
	}

	@Override
	public void onUnityAdsError(UnityAds.UnityAdsError error, String message) {
		Log.d("---", "onUnityAdsError: " + error + " - " + message);
		toast("Error", error + " " + message);
	}

	private void toast(String callback, String msg) {
		// Toast.makeText(getApplicationContext(), callback + ": " + msg, Toast.LENGTH_SHORT).show();
	}
}