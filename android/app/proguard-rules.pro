## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.firebase.** { *; }
-dontwarn io.flutter.embedding.**
-ignorewarnings
-keep class * extends java.util.ListResourceBundle {
 protected Object[][] getContents();
}
-keep class sun.misc.Unsafe { *; }
-keep class androidx.lifecycle.** { *; }
-keep class your.package.name.** { *; }
