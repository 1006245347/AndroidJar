package com.hwj.androidjar;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.hwj.sdk.SdkLibUtil;

/**
 * @author by jason-何伟杰，2022/8/31
 * des:测试页面
 */
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        init();
    }

    private void init() {
        findViewById(R.id.btnClick).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(MainActivity.this, SdkLibUtil.testFun(), Toast.LENGTH_SHORT).show();
            }
        });
    }
}