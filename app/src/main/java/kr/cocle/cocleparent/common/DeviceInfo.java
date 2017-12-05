package kr.cocle.cocleparent.common;

import android.content.Context;
import android.os.Build;

import java.util.UUID;

import Utils.LogUtil;
import Utils.SharedPreferencesUtil;

/**
 * Created by chan1park on 2017. 05. 01.
 *
 * 디바이스 정보
 */

public class DeviceInfo {

    private static final String DEVICE_ID_KEY = "IOT_TRADAR";
    private static final String DEVICE_PUSH_KEY = "FCM_ID";

    /**
     * 디바이스 UUID를 생성
     * @param ctx
     */
    public static String getRandomUUID(Context ctx) {
        return UUID.randomUUID().toString();
    }

    /**
     * Preference UDID를 저장한다
     */
    public static void setUDID(Context ctx, String UDID) {
        SharedPreferencesUtil.putString(ctx, DEVICE_ID_KEY, UDID);
    }

    /**
     * Preference에 저장되어있는 UDID를 가져온다
     * @return String UDID
     */
    public static String getUDID(Context ctx) {
        String UDID = SharedPreferencesUtil.getString(ctx, DEVICE_ID_KEY, "");
        return UDID;
    }

    /**
     * Preference FCM Token을 저장한다
     *
     * @param ctx    Application Context
     * @param fcmToken FCM Token String
     */
    public static void setFCMToken(Context ctx, String fcmToken) {
        SharedPreferencesUtil.putString(ctx, DEVICE_PUSH_KEY, fcmToken);
    }

    /**
     * Preference에 저장되어있는 FCM Token를 가져온다
     *
     * @return String FCM Token String
     */
    public static String getFCMToken(Context ctx) {
        return SharedPreferencesUtil.getString(ctx, DEVICE_PUSH_KEY, "0");
    }

    /**
     * 현재 단말기 정보를 세팅하고 로그를 찍는다.
     * @param tag
     */
    public static void setDeviceInfo(String tag) {

        DeviceModel model = new DeviceModel();
        model.brand = Build.BRAND.toUpperCase();
        model.model = Build.MODEL;
        model.manufacturer = Build.MANUFACTURER;
        model.os = Build.DISPLAY;
        model.version = Build.VERSION.RELEASE;

        LogUtil.d(tag, "DEVICE_BRAND : " + model.brand);
        LogUtil.d(tag, "DEVICE_MODEL : " + model.model);
        LogUtil.d(tag, "DEVICE_MUNUFATURER : " + model.manufacturer);
        LogUtil.d(tag, "DEVICE_OS : " + model.os);
        LogUtil.d(tag, "DEVICE_VERSION : " + model.version);

    }
}
