package ir.bezidev.auto_mafia

import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import ir.myket.developerapi.util.MyketResult
import ir.myket.developerapi.util.MyketSupportHelper
import ir.myket.developerapi.util.Update

class MainActivity : FlutterActivity() {
    private val CHANNEL = "ir.bezidev.auto_mafia/update"
    private lateinit var mMyketHelper: MyketSupportHelper

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                if (call.method == "checkAppUpdate") {
                    checkAppUpdate(result)
                } else {
                    result.notImplemented()
                }
            }
        mMyketHelper = MyketSupportHelper(this)
        mMyketHelper.startSetup(object : MyketSupportHelper.OnMyketSetupFinishedListener {
            override fun onMyketSetupFinished(result: MyketResult) {
                // Handle szetup finished
            }
        })
    }

    private fun checkAppUpdate(result: MethodChannel.Result) {
        mMyketHelper.getAppUpdateStateAsync(object : MyketSupportHelper.CheckAppUpdateListener {
            override fun onCheckAppUpdateFinished(myketResult: MyketResult, update: Update) {
                if (myketResult.isSuccess) {
                    if (update.isUpdateAvailable) {
                        result.success(update.description)
                    } else {
                        result.success("No update available")
                    }
                } else {
                    result.error("UNAVAILABLE", "Myket service unavailable", null)
                }
            }
        })
    }
}
