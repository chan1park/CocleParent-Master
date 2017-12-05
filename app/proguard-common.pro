#-optimizations !class/unboxing/enum         # 최적화 작업 ( class / unboxing / enum )
#-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
#-optimizationpasses 5
-dontusemixedcaseclassnames                 # 대소문자 섞인 클래스 이름 허용 않음
-dontpreverify                              # 사전 검증기능을 사용하지 않음
-dontshrink                                 # 사용하지 않는 메소드 유지 ( 사용 메서드가 난독화 되는 경우가 발생 )
-dontoptimize                               # 압축(최적화) 하지 않음
-ignorewarnings                             # 경고 무시

-keepattributes SourceFile,LineNumberTable,InnerClasses  # 소스파일 줄정보 유지

#For Fabric to properly de-obfuscate your crash reports,
#you need to remove this line from your configuration file, or we won’t be able to automatically upload your mapping file:
-printmapping mapping.txt

#-dontskipnonpubliclibraryclasses
#-dontskipnonpubliclibraryclassmembers
#-allowaccessmodification
#-repackageclasses ''
#-renamesourcefileattribute SourceFile       # 파일 이름 모두 SourceFile 로 변경

#-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*


# dexguard 에 대한 난독화 옵션 ------------------
-keep class com.saikoa.*
-keep class org.w3c.** { *; }
-renamesourcefileattribute DexGuard


# ------------------ manifest 의 최소 필수 요소의 이름 난독화 제거 ------------------
#-keepresourcexmlattributenames 'manifest/installLocation,manifest/versionCode,manifest/application/*/intent-filter/*/name'

-keepattributes *Annotation*    # 앞뒤로 Annotation 이름을 갖는 속성 유지
-keepattributes Signature       # Generic Type 속성 유지
-keepattributes InnerClasses    # 내부 클래스 속성 유지


# 네이티브 메소드를 포함하고 있는 클래스 및 멤버이름 유지
-keepclasseswithmembernames class * {
    native <methods>;
}


# 다음 parameter 를 갖는 모든 public class 의 생성자 유지
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}



# 다음에 해당하는 onClick handler 를 가능한한 보존
-keepclassmembers class * extends android.content.Context {
    public void *(android.view.View);
    public void *(android.view.MenuItem);
}

# Animations 동작을 위해 View setter를 유지
-keepclassmembers public class * extends android.view.View {
  void set*(***);
  *** get*();
}


# 다음 클래스를 상속 받은 모든 클래스의 난독화 제거
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.preference.Preference
-keep public class * extends android.text.InputFilter
-keep public class com.android.vending.licensing.ILicensingService
-keep public class * extends android.app.Fragment {
    <init>(...);
}
-keep public class * extends java.lang.Exception
# v4 view 난독화 제거
-keep public class * extends android.support.v4.** { *; }
# v7 widget 난독화 제거
-keep public class * extends android.support.v7.widget.** { *; }
# Volley Request 를 상속받는 클래스 난독화 제거
-keep public class * extends com.android.volley.Request

-keep public class * extends android.support.v4.app.Fragment {
    <init>(...);
}
-keep public class * extends android.view.View {
        public <init>(android.content.Context);
        public <init>(android.content.Context, android.util.AttributeSet);
        public <init>(android.content.Context, android.util.AttributeSet, int);
        public void set*(...);
}


# 다음 public static 으로 된 enum 유지
-keepclassmembers enum  * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# android.os.Parcelable 을 구현한 클래스 유지
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

#-keep class * implements android.content.SharedPreferences
#-keep class com.securepreferences.*
#-keep class com.scottyab.*
#-keep class java.security.*
#-keep class javax.crypto.*
#-keep class org.apache.harmony.security.*
#-keep class java.nio.*
#-keep class java.util.*
-keep class com.tozny.crypto.android.*
-keep class com.tozny.crypto.android.AesCbcWithIntegrity$PrngFixes$* { *; }
-keep class * extends java.security.SecureRandomSpi

# R class 의 모든 static 필드 유지
-keepclassmembers class **.R$* {
    public static <fields>;
}

# Parcelabe 구현 필도 유지
-keepclassmembers class * implements android.os.Parcelable {
    static android.os.Parcelable$Creator CREATOR;
}


# 다음 직렬화를 구현한 모든 클래스의 멤버에 대한 난독화 제거
-keepclassmembers class * implements java.io.Serializable {
        static final long serialVersionUID;
        static final java.io.ObjectStreamField[] serialPersistentFields;
        private void writeObject(java.io.ObjectOutputStream);
        private void readObject(java.io.ObjectInputStream);
        java.lang.Object writeReplace();
        java.lang.Object readResolve();
}

# SecurePreferences 에 대한 난독화 제거
-keep class com.tozny.crypto.android.AesCbcWithIntegrity$PrngFixes$* { *; }


# commons-lang3
# org.apache.commons:commons-lang3:3.0
-keep class org.apache.commons.lang3.** { *; }
-keep interface org.apache.commons.lang3.** { *; }


# android.support.v7
# com.android.support:appcompat-v7:22.2.0
# fixme appcompat v7 samsung 4.2.2 bug issue proguard 셋팅 replace 했음. TEST 필요.
#-keep public class android.support.v7.widget.** { *; }
#-keep public class android.support.v7.internal.widget.** { *; }
#-keep public class android.support.v7.internal.view.menu.** { *; }
-dontwarn android.support.v7.**
-keep class android.support.v7.** { *; }
-keep interface android.support.v7.** { *; }

-dontwarn android.support.v4.**
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }

# with this:

# Allow obfuscation of android.support.v7.internal.view.menu.**
# to avoid problem on Samsung 4.2.2 devices with appcompat v21
# see https://code.google.com/p/android/issues/detail?id=78377
-keep class !android.support.v7.internal.view.menu.**,android.support.** {*;}


# Keep SafeParcelable value, needed for reflection. This is required to support backwards
# compatibility of some classes.
-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

# Keep the names of classes/members we need for client functionality.
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
    @com.google.android.gms.common.annotation.KeepName *;
}

# AndroidAnnotation
# org.androidannotations:androidannotations-api


# Only required if you use AsyncExecutor
-keepclassmembers class * extends de.greenrobot.event.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}



#-keep class com.cubemst.** { *; }
#-keep interface com.cubemst.** { *; }

# PlaceTimeRealease

# android version m
-keep class org.apache.http.** { *; }
-dontwarn org.apache.http.**
-keep class android.net.http.** { *; }
-dontwarn android.net.http.**
-dontwarn com.google.android.gms.**
-keepclasseswithmembers class * {
    void onClick*(...);
}
-keepclasseswithmembers class * {
    *** *Callback(...);
}


-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions



# ------------------ Log 제거 ------------------
#-assumenosideeffects class android.util.Log {
#    public static boolean isLoggable(java.lang.String, int);
#    public static int v(...);
#    public static int i(...);
#    public static int w(...);
#    public static int d(...);
#    public static int e(...);
#    public static java.lang.String getStackTraceString(java.lang.Throwable);
#}

# Debug log 제거
#-assumenosideeffects class android.util.Log {
#    public static *** d(...);
#    public static *** v(...);
#    public static *** w(...);
#    public static *** e(...);
#}

# resource & file name obfuscate
-adaptresourcefilenames **.properties,**.xml,**.png,**.jpg,**.gif
