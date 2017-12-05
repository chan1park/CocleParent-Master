
# -------------- 라이브러리 난독화 -----------------


# Begin: Proguard rules for okhttp3
-dontwarn okhttp3.**
-dontwarn okio.**
-dontnote okhttp3.**

# libraries keep
# Okhttp
-keep class com.squareup.okhttp3.** { *; }

# Begin: Proguard rules for retrofit2
# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on RoboVM on iOS. Will not be used at runtime.
-dontnote retrofit2.Platform$IOS$MainThreadExecutor
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.

# library don't warning
-dontwarn com.saikoa.**
-dontwarn org.acra.**
-dontwarn org.apach.commons.lang3.**
-dontwarn com.google.zxing.**
-dontwarn com.google.gson.**
-dontwarn com.noneoldandroids.**
-dontwarn com.cubemst.**
-dontwarn android.support.**
-dontwarn org.androidannotations.**
-dontnote org.androidannotations.**


# crashlytics(fabric)
-keep class com.crashlytics.** { *; }
-keep interface com.crashlytics.** { *; }
-keep class com.crashlytics.** { *; }
-dontwarn com.crashlytics.**


# EventBus
# de.greenrobot:eventbus:2.4.0
# https://github.com/greenrobot/EventBus/blob/master/HOWTO.md
-keepclassmembers class ** {
    public void onEvent*(**);
}

# gson
# com.google.code.gson:gson:2.3.1
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.** { *; }
-keep interface com.google.gson.** { *; }
-keep public class com.hilever.unitouch.model.** { *; }



# smoothprogressbar
# jp.wasabeef:recyclerview-animators:1.2.0@aar
-keep class fr.castorflex.android.smoothprogressbar.** { *;}
