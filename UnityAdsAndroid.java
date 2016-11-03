import com.unity3d.ads.IUnityAdsListener;
import com.unity3d.ads.UnityAds;

public class UnityAdsAndroid implements IUnityAdsListener 
{
	public UnityAdsAndroid()
	{
			UnityAds.initialize(this, "4f3ed4d1-0166-4563-a1ce-1f5263e2a8c2", this);
			if (UnityAds.isReady()) { UnityAds.show(this); }
	}

	@Override
	public void onUnityAdsReady(final String zoneId) {
		DeviceLog.debug("onUnityAdsReady: " + zoneId);
		Utilities.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// look for various default placement ids over time
				switch (zoneId) {
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
				}
			}
		});

		toast("Ready", zoneId);
	}

	@Override
	public void onUnityAdsStart(String zoneId) {
		DeviceLog.debug("onUnityAdsStart: " + zoneId);
		toast("Start", zoneId);
	}

	@Override
	public void onUnityAdsFinish(String zoneId, UnityAds.FinishState result) {
		DeviceLog.debug("onUnityAdsFinish: " + zoneId + " - " + result);
		toast("Finish", zoneId + " " + result);
	}

	@Override
	public void onUnityAdsError(UnityAds.UnityAdsError error, String message) {
		DeviceLog.debug("onUnityAdsError: " + error + " - " + message);
		toast("Error", error + " " + message);

		TextView statusText = (TextView) findViewById(R.id.unityads_example_statustext);
		statusText.setText(error + " - " + message);
	}

	private void toast(String callback, String msg) {
		Toast.makeText(getApplicationContext(), callback + ": " + msg, Toast.LENGTH_SHORT).show();
	}
}