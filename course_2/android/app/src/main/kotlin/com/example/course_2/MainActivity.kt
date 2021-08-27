package com.example.course_2

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object {
        const val CHANNEL = "example.com/native_flutter"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!);

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { methodCall, result ->
                    if(methodCall.method == "getValue"){
                        result.success("성공")
                    }else {
                        result.notImplemented()
                    }
                }
    }
}
