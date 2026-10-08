package com.example.remedi

import android.net.Uri
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

// FlutterFragmentActivity is required by the Health Connect permission flow.
class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // On-device OCR with ML Kit's bundled model (works offline).
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "remedi/ocr").setMethodCallHandler { call, result ->
            if (call.method != "recognize") {
                result.notImplemented()
                return@setMethodCallHandler
            }
            val path = call.argument<String>("path")
            if (path == null) {
                result.error("bad_args", "Missing path", null)
                return@setMethodCallHandler
            }
            try {
                val image = InputImage.fromFilePath(this, Uri.fromFile(File(path)))
                val recognizer = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
                recognizer.process(image)
                    .addOnSuccessListener { text -> result.success(text.text) }
                    .addOnFailureListener { e -> result.error("ocr_failed", e.message, null) }
                    .addOnCompleteListener { recognizer.close() }
            } catch (e: Exception) {
                result.error("bad_image", e.message, null)
            }
        }
    }
}
