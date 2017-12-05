package Utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;

import kr.thingradar.engineer.common.DeviceInfo;

/**
 * Create by chan1park on 17.05.01
 *
 * 보안용 SharedPreferences
 */
public class SecurePreferencesUtil {

    private static final String PREF_FILE_NAME = "sec_pref.xml";

    private static SecurePreferencesUtil instance;
    private SecurePreferences mSecurePreferences;

    /**
     * Constructor
     * @param ctx
     */
    private SecurePreferencesUtil(Context ctx) {
        String deviceId = getDeviceId(ctx);
        mSecurePreferences = new SecurePreferences(ctx, deviceId, PREF_FILE_NAME);
    }

    /**
     * Singleton Instance
     *
     * @param ctx
     * @return
     */
    public synchronized  static SecurePreferencesUtil getInstance(Context ctx) {
        if (null == instance) {
            instance = new SecurePreferencesUtil(ctx);
        }
        return instance;
    }

    /**
     * DeviceID를 반환함
     * 없으면 생성 후 DeviceInfo에 설정 및 반환
     * @param ctx
     * @return UUID DeviceID
     */
    private static String getDeviceId(Context ctx) {
        String deviceId = DeviceInfo.getUDID(ctx);
        if (TextUtils.isEmpty(deviceId)) {
            deviceId = DeviceInfo.getRandomUUID(ctx);
            DeviceInfo.setUDID(ctx, deviceId);
        }
        return deviceId;
    }

    /**
     * key값으로 String 저장함
     *
     * @param key
     * @param value
     */
    public synchronized void putString(String key, String value) {
        SharedPreferences.Editor editor = mSecurePreferences.edit();
        editor.putString(key, value);
        editor.commit();
    }

    /**
     * key값으로 String 반환함
     *
     * @param key
     * @return
     */
    public synchronized String getString(String key) {
        return mSecurePreferences.getString(key, null);
    }

    /**
     * key값으로 boolean 저장함
     *
     * @param key
     * @param value
     */
    public synchronized void putBoolean(String key, boolean value) {
        SharedPreferences.Editor editor = mSecurePreferences.edit();
        editor.putBoolean(key, value);
        editor.commit();
    }

    /**
     * key값으로 boolean 반환함
     *
     * @param key
     * @return
     */
    public synchronized boolean getBoolean(String key) {
        return mSecurePreferences.getBoolean(key, false);
    }

    /**
     * editor 반환
     *
     * @return
     */
    public synchronized SecurePreferences.Editor getEditor() {
        return mSecurePreferences.edit();
    }

    /**
     * Preference 반환
     *
     * @return
     */
    public SecurePreferences getPreference() {
        return mSecurePreferences;
    }

    public synchronized void remove(String key) {
        SharedPreferences.Editor editor = mSecurePreferences.edit();
        editor.remove(key);
        editor.commit();
    }
}
