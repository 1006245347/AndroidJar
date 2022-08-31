package com.hwj.sdk;

import android.app.Application;
import android.content.Context;
import android.util.Log;

/**
 * @author by jason-何伟杰，2022/8/31
 * des:sdk管理类
 */
public class SdkLibUtil {
    private static Application mApplication;
    private static String mAppId;    //接入项目申请到的id
    private static String mUniqueId; //设备唯一id
    private static String TAG = "TAG";

    public static void init(Application application, String appId) {
        init(application, appId, DeviceIdUtil.getUniqueId(application.getApplicationContext()));
    }

    public static void init(Application application, String appId, String uniqueId) {
        mApplication = application;
        mAppId = appId;
        mUniqueId = uniqueId;
        if (mApplication == null) {
            Log.e(TAG, "Application Context should not be null!");
        }
        //部分机型中，指定目录报无法读取目录，但是目录能在文件管理器看到，目前无法解决
//        new MMKVUtil.Builder().setSavePath(application.getExternalFilesDir("aj_dir").getPath()).build();
        new MMKVUtil.Builder().setSavePath("").build();
        MMKVUtil.addStr("appid", mAppId);
        MMKVUtil.addStr("uid", mUniqueId);
    }

    public static String testFun() {
        String log = "test_funtion=" + MMKVUtil.getStr("appid") + " " + MMKVUtil.getStr("uid");
        Log.v(TAG, log);
        return log;
    }

    public static void nilFun() {
        //just for test name can be change!
    }

    public static void testSdk() {

    }

    public static Context getSdkContext() {
        return mApplication;
    }
}
