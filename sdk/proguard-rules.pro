# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#有效 不混淆整个包的文件
-keep class com.hwj.sdk.**

#有效 不混淆某个类的public方法，但里面的内容会
#-keepclassmembers class com.hwj.sdk.SdkLibUtil{
# public *;
#}

#不混淆某个类，看到所有信息
#-keep class com.hwj.sdk.SdkLibUtil {*;}
#看到类名
-keep class com.hwj.sdk.SdkLibUtil
#指定GreeNp类下的某些方法 testXX()不被混淆,注意修改返回值
-keep class com.hwj.sdk.SdkLibUtil {
    public java.lang.String test*(...);
    public void init(...);
}

#这些都是sdk里的文件，如果写成文件名就会报红线
-keep class com.hwj.sdk.MMKVUtil
-keep class com.hwj.sdk.NpHttpUtil {*;}
-keep class com.hwj.sdk.NpHttpUtil

#反射的使用，混淆后导致无法找到方法 ,这里必须找到类的具体路径
#需要直接在jar包中找到对应的三方库，每个层级下查看类路径，然后抽出来单独不混淆
#当然你要最简单，整个库都不混淆那就没技术含量了 （>_<）
-keep class okhttp3.internal.tls.TrustRootIndex {*;}
-keep class okhttp3.internal.tls.TrustRootIndex
-keep class java.security.cert.** {*;}
-keep class com.hwj.sdk.TrustAllCerts {*;}
-keep class com.hwj.sdk.TrustAllCerts

#不混淆某个依赖库下的所有文件，只是类名清晰，里面的函数、内部类、接口依然混淆
-keep class com.tencent.mmkv.** {*;}
-keep class com.github.gzuliyujiang.oaid.** {*;}
-keep class okio.** {*;}
-keep class okhttp3.** {*;}
-keep class javax.net.ssl.** {*;}

-keep class javax.net.ssl.HostnameVerifier{*;}
#内部类对象需要单独处理，否则依然混淆 ,如HostnameVerifier$.verifier()被混淆成a()
#代表保留  A$* 表示所有A的内部类都保留下来
-keep class javax.net.ssl.HostnameVerifier$* {*;}
-keep class com.lyentech.sdk.NpHttpUtil$* {*;}

#是否混淆第三方jar
-dontskipnonpubliclibraryclasses

#####混淆保护自己项目的部分代码以及引用的第三方jar包library#######
-libraryjars libs/okio-3.0.0.jar

# java.io.IOException: Please correct the above warnings first. 66666忽略警告
-ignorewarnings

#-dontwarn com.lyentech.sdk.**
#-dontwarn com.lyentech.reformcode.**

-optimizationpasses 5
-dontskipnonpubliclibraryclassmembers
-printmapping proguardMapping.txt
-optimizations !code/simplification/cast,!field/*,!class/merging/*
-keepattributes *Annotation*,InnerClasses
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable

# 保留本地native方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

#表示混淆时不使用大小写混合类名
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
#打印混淆的详细信息
-verbose

#不优化，作用于全局
-dontoptimize

-dontpreverify

-keepattributes *Annotation*

-dontwarn com.squareup.okhttp.**
-keep class com.squareup.okhttp.** {*;}
-keep interface com.squareup.okhttp.** {*;}
-dontwarn okio.**

#以下是第三方库Android_cn_oaid的混淆规则,没啥用但是官方贴出来，我就放着
#-keep class repeackage.com.uodis.opendevice.aidl.** { *; }
#-keep interface repeackage.com.uodis.opendevice.aidl.** { *; }
#-keep class repeackage.com.asus.msa.SupplementaryDID.** { *; }
#-keep interface repeackage.com.asus.msa.SupplementaryDID.** { *; }
#-keep class repeackage.com.bun.lib.** { *; }
#-keep interface repeackage.com.bun.lib.** { *; }
#-keep class repeackage.com.heytap.openid.** { *; }
#-keep interface repeackage.com.heytap.openid.** { *; }
#-keep class repeackage.com.samsung.android.deviceidservice.** { *; }
#-keep interface repeackage.com.samsung.android.deviceidservice.** { *; }
#-keep class repeackage.com.zui.deviceidservice.** { *; }
#-keep interface repeack