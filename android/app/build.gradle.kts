plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

import java.util.Properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) keystoreProperties.load(keystorePropertiesFile.inputStream())

android {
    namespace = "com.ibrahimshoshaaa.flutterfood"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
    compileOptions { sourceCompatibility = JavaVersion.VERSION_11; targetCompatibility = JavaVersion.VERSION_11 }
    kotlinOptions { jvmTarget = JavaVersion.VERSION_11.toString() }
    signingConfigs { create("release") { if (keystorePropertiesFile.exists()) { keyAlias = keystoreProperties["keyAlias"] as String; keyPassword = keystoreProperties["keyPassword"] as String; storeFile = file(keystoreProperties["storeFile"] as String); storePassword = keystoreProperties["storePassword"] as String } } }
    defaultConfig { applicationId = "com.ibrahimshoshaaa.flutterfood"; minSdk = flutter.minSdkVersion; targetSdk = flutter.targetSdkVersion; versionCode = flutter.versionCode; versionName = flutter.versionName }
    buildTypes { release { signingConfig = signingConfigs.getByName("release") } }
}
flutter { source = "../.." }
