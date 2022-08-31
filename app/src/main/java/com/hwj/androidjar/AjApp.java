package com.hwj.androidjar;

import android.app.Application;

import com.hwj.sdk.SdkLibUtil;

/**
 * @author by jason-何伟杰，2022/8/31
 * des: 全局默认进程Application
 */
public class AjApp extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        //框架初始化
        SdkLibUtil.init(this, "20220831build");
    }
}
