package kr.cocle.cocleparent.base;

import android.app.Application;

import com.crashlytics.android.Crashlytics;
import com.crashlytics.android.answers.Answers;
import com.tsengvn.typekit.Typekit;

import io.fabric.sdk.android.Fabric;

/**
 * Created by chan1park on 2017. 12. 4..
 *
 * Base Application
 */

public class BaseApplication extends Application{

    @Override
    public void onCreate() {
        super.onCreate();

        Fabric fabric = new Fabric.Builder(this)
                .kits(new Crashlytics())
                .debuggable(true)
                .build();
        Fabric.with(fabric);
        Fabric.with(getApplicationContext(), new Answers(), new Crashlytics());

        /*폰트 적용*/
        Typekit.getInstance()
                .addNormal(Typekit.createFromAsset(this, "fonts/NanumGothic.otf"))
                .addBold(Typekit.createFromAsset(this, "fonts/NanumGothicExtraBold.otf"));

    }
}
