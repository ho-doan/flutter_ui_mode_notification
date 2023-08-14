package com.hodoan.flutter_ui_mode_notification

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.res.Configuration
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel

/** FlutterUiModeNotificationPlugin */
class FlutterUiModeNotificationPlugin : FlutterPlugin, ActivityAware, EventChannel.StreamHandler {
    private var activity: Activity? = null
    private var sink: EventChannel.EventSink? = null
    private lateinit var context: Context

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(p0: Context?, p1: Intent?) {
            when (p1?.action) {
                Intent.ACTION_CONFIGURATION_CHANGED -> {
                    uiModeChange()
                    Log.e(
                        FlutterUiModeNotificationPlugin::class.simpleName,
                        "onReceive: ACTION_CONFIGURATION_CHANGED $p1"
                    )
                }
            }
        }
    }

    private fun uiModeChange() {
        activity?.let {
            val mode =
                it.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK == Configuration.UI_MODE_NIGHT_YES
            sink?.success(mode)
        }
    }

    private fun listen(context: Context) {
        val filter = IntentFilter()
        filter.addAction(Intent.ACTION_CONFIGURATION_CHANGED)
        context.registerReceiver(receiver, filter)
    }

    private fun dispose(context: Context) {
        context.unregisterReceiver(receiver)
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        EventChannel(binding.binaryMessenger, "flutter_ui_mode_notification").setStreamHandler(this)
        listen(context)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        activity = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivity() {
        activity = null
        sink = null
        dispose(context)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(arguments: Any?) {
        sink = null
    }
}
