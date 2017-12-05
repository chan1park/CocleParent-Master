package kr.cocle.cocleparent.base;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

import com.crashlytics.android.Crashlytics;
import com.crashlytics.android.answers.Answers;
import com.crashlytics.android.answers.CustomEvent;
import com.tsengvn.typekit.TypekitContextWrapper;

/**
 * Created by chan1park on 2017. 12. 4..
 *
 * Base Activity
 */

public class BaseActivity extends AppCompatActivity implements View.OnClickListener {

    private Context mContext;

    private Answers mAnswers;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mContext = this;
        mAnswers = Answers.getInstance();
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    public void onClick(View v) {

    }

    /**
     * Fabric 메뉴 진입 통계
     *
     * @param msg
     */
    protected void logMenuEvent(int msg) {
        mAnswers.logCustom(new CustomEvent(getString(msg)));
    }

    /**
     * Fabric 유저 로그
     * Crashlytics Event 시 해당 사용자 정보를 보여준다.
     *
     * @param name      // User Name
     * @param idetifier // User kind
     * @param email     // User ID
     */
    protected void logUser(String name, String idetifier, String email) {
        // You can call any combination of these three methods
        try {
            Crashlytics crashlytics = Crashlytics.getInstance();
            crashlytics.setUserName(name);
            crashlytics.setUserIdentifier(idetifier);
            crashlytics.setUserEmail(email);
        } catch (Exception e) {
        }
    }

    /**
     * 패키지 정보를 돌려준다.
     * 버젼코드와 버젼 이름 체크
     *
     * @return
     */
    public PackageInfo getPackageInfo() {
        PackageInfo pi = null;
        try {
            pi = getPackageManager().getPackageInfo(getPackageName(), 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pi;
    }

    /**
     * Mobile / Wifi 연결상태 반환
     * @param context
     * @return
     */
    public boolean getNetworkStatus(Context context) {
        NetworkInfo mobile, wifi;
        ConnectivityManager mManger = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        mobile = mManger.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        wifi = mManger.getNetworkInfo(ConnectivityManager.TYPE_WIFI);

        if(wifi.isConnected()) {
            return true;
        } else if(mobile.isConnected()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 폰트 적용
     *
     * @param newBase
     */
    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(TypekitContextWrapper.wrap(newBase));
    }

}
