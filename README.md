Cocle 학부모용 Android App
===================
### Greetings
    Cocle 학부모용 Android App 입니다.
    Cocle 교육에 대한 조회를 정보하고
    자녀의 교육 진도 및 성취도 / 학습정보를 확인 할 수 있습니다.

### Main functions
...

### App Developer 
    chan1park 

### Version
    appVersion 1.0.0

### Installation
You need Gulp installed globally:

```sh
$ git clone https://github.com/eugene-haas/TRadar-Android-Engineer.git
```

### Library

    implementation fileTree(dir: 'libs', include: ['*.jar'])

    // v4 Compat
    //noinspection GradleCompatible
    compile 'com.android.support:support-compat:24.2.0'

    // v7 Compat
    //noinspection GradleCompatible
    compile 'com.android.support:appcompat-v7:24.2.1'

    // Core Util Library
    compile 'com.android.support:support-core-utils:24.2.0'

    // Core UI Library
    compile 'com.android.support:support-core-ui:24.2.0'

    // Design Library
    compile 'com.android.support:design:24.2.1'

    // Android annotations
    compile 'com.android.support:support-annotations:24.2.0'

    // Constraint Layout
    compile 'com.android.support.constraint:constraint-layout:1.0.2'

    // jUnit
    compile 'junit:junit:4.12'

    // Rx Android
    compile 'io.reactivex:rxandroid:1.1.0'

    // Fabric crashlytics & answers
    compile('com.crashlytics.sdk.android:crashlytics:2.6.8@aar') {
        transitive = true;
    }
    compile('com.crashlytics.sdk.android:answers:1.3.13@aar') {
        transitive = true;
    }

    // Retrofit
    compile 'com.squareup.retrofit2:retrofit:2.2.0'
    compile 'com.squareup.retrofit2:converter-gson:2.1.0'

    // OkHttp
    compile 'com.squareup.okhttp3:okhttp:3.4.2'
    compile 'com.squareup.okhttp3:logging-interceptor:3.4.2'

    // SuperToast
    compile 'com.github.johnpersano:supertoasts:1.3.4@aar'

    // SecurePreferences
    compile 'com.scottyab:secure-preferences-lib:0.1.4'

    // GlideImageLoader
    compile 'com.github.bumptech.glide:glide:3.6.1'

    // RecyclerView
    compile 'com.android.support:recyclerview-v7:24.2.0'

    // CircleIndicator
    compile 'me.relex:circleindicator:1.2.2@aar'

    // Material Style Progress Dialog
    compile 'com.afollestad.material-dialogs:commons:0.9.4.4'

    // EventBus
    compile 'org.greenrobot:eventbus:3.0.0'

    // Butter knife
    compile 'com.jakewharton:butterknife:7.0.1'

    // Material Style SeekBar
    compile 'com.crystal:crystalrangeseekbar:1.1.1'

    // Typekit font
    compile 'com.tsengvn:Typekit:1.0.0'
    
### License
    5N Co., Ltd.

### Company Infomation
    www.5n.co.kr