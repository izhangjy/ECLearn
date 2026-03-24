plugins {
    id("com.android.application")
    id("kotlin-android")
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
        applicationId = "com.example.eclearn"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

afterEvaluate {
    tasks.named("assembleDebug") {
        doLast {
            val flutterRootDir = project.rootProject.projectDir.parentFile
            val flutterApkDir = File(flutterRootDir, "build/app/outputs/flutter-apk")
            flutterApkDir.mkdirs()

            val sourceApk = File(project.buildDir, "outputs/apk/debug/app-debug.apk")
            if (sourceApk.exists()) {
                val destApk = File(flutterApkDir, "app-debug.apk")
                sourceApk.copyTo(destApk, overwrite = true)
                println("✓ Copied APK from ${sourceApk.absolutePath} to ${destApk.absolutePath}")
            } else {
                println("✗ Source APK not found at ${sourceApk.absolutePath}")
                println("Checking build outputs directory:")
                val apkDebugDir = File(project.buildDir, "outputs/apk/debug")
                if (apkDebugDir.exists()) {
                    apkDebugDir.listFiles()?.forEach {
                        println("  Found: ${it.name}")
                    }
                } else {
                    println("  Directory does not exist: ${apkDebugDir.absolutePath}")
                }
            }
        }
    }
}
