package com.example.flutter_access_native

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private var result: MethodChannel.Result? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, "flutter.native/helper")
      .setMethodCallHandler { methodCall, result ->
        methodCall.method?.let {
          if (methodCall.method.equals("accessFromNativeCode")) {
            var res = accessFromNativeCode()
            result.success(res);
          }
        }
      }
  }

  private fun accessFromNativeCode():String {
    return "Access from Native Android Code"
  }
}
