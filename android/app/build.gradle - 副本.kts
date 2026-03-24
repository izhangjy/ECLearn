plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}

android {
    namespace = "com.example.eclearn"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }


    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.eclearn"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // 核心：强制 APK 输出到 Flutter 预期路径（兼容所有 Gradle 版本）
    applicationVariants.all {
        val variant = this
        variant.outputs.forEach { output ->
            // 1. 定义 Flutter 预期的输出目录
            val flutterApkDir = File(project.rootProject.rootDir, "build/app/outputs/flutter-apk")
            flutterApkDir.mkdirs() // 确保目录存在

            // 2. 兼容方式设置 APK 输出路径和文件名（关键！）
            val outputFileName = "app-debug.apk"
            val outputPath = File(flutterApkDir, outputFileName)
            
            // 3. 适配 Gradle 8.x 的路径设置方式
            if (output is com.android.build.gradle.internal.api.ApkVariantOutputImpl) {
                output.setOutputPath(outputPath)
            } else {
                // 兜底方案：直接修改输出文件名和路径
                output.outputFileName = outputFileName
                project.tasks.findByName("assemble${variant.name.capitalize()}")?.doLast {
                    val builtApk = File("${project.buildDir}/outputs/apk/${variant.name}/app-${variant.name}.apk")
                    if (builtApk.exists()) {
                        builtApk.copyTo(outputPath, overwrite = true)
                    }
                }
            }
        }
    }
}

flutter {
    source = "../.."
}
